class WalletsController < ApplicationController
  before_action :authenticate_user!

  def index
    @wallet = current_user.wallet
    @purchases = @wallet.buys.includes(:cryptocurrency)
  end

  def create_wallet
    create_wallet!(balance: current_user.balance)
  end
end
