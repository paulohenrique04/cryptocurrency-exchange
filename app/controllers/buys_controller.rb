class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @buys = current_user.buys.includes(:cryptocurrency)
  end

  def create
    cryptocurrency = Cryptocurrency.find(params[:cryptocurrency_id])
    total_value = cryptocurrency.value * buy_params[:quantity].to_f

    if current_user.balance < total_value
      redirect_to cryptocurrency_path(cryptocurrency), alert: 'Saldo insuficiente para realizar a compra.'
      return
    end

    @buy = current_user.buys.build(
      cryptocurrency_id: cryptocurrency.id,
      quantity: buy_params[:quantity],
      crypto_value: total_value
    )

    ActiveRecord::Base.transaction do
      if @buy.save
        current_user.update!(balance: current_user.balance - total_value)
        redirect_to cryptocurrency_path(cryptocurrency), notice: 'Compra realizada com sucesso!'
      else
        redirect_to cryptocurrency_path(cryptocurrency), alert: 'Erro ao realizar a compra.'
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    redirect_to cryptocurrency_path(cryptocurrency), alert: "Erro ao realizar a compra: #{e.message}"
  end

  private 

  def buy_params
    params.require(:buy).permit(:quantity)
  end
end