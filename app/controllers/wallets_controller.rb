class WalletsController < ApplicationController
  before_action :authenticate_user!

  def show
    @wallet = current_user.wallet
    @purchases = @wallet.purchases.includes(:cryptocurrency)
  end
end
