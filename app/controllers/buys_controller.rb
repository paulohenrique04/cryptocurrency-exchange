class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cryptocurrency, only: [:create]

  def index
    @buys = current_user.buys.includes(:cryptocurrency)
  end

  def create
    quantity = params[:quantity].to_f
    total_value = quantity * @cryptocurrency.value

    if current_user.balance >= total_value
      ActiveRecord::Base.transaction do
        current_user.update!(balance: current_user.balance - total_value)
        current_user.wallet.purchases.create!(
          cryptocurrency: @cryptocurrency,
          quantity: quantity,
          crypto_value: @cryptocurrency.value
        )
      end
      redirect_to purchases_path, notice: 'Compra realizada com sucesso!'
    else 
      redirect_to @cryptocurrency, alert: 'Saldo insuficiente!'
    end
  end

  def set_cryptocurrency
    @cryptocurrency = Cryptocurrency.find(params[:cryptocurrency_id])
  end
end
