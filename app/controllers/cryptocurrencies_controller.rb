class CryptocurrenciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cryptocurrency, only: [:show, :edit, :update, :destroy]

  def index
    @cryptocurrencies = Cryptocurrency.all
  end

  def show
  end

  def new
    @cryptocurrency = Cryptocurrency.new
  end

  def create
    @cryptocurrency = Cryptocurrency.new(cryptocurrency_params)
    if @cryptocurrency.save 
      redirect_to @cryptocurrency, notice: 'Criptomoeda criada com sucesso'
    else 
      render :new
    end
  end

  def edit
  end

  def update
    @cryptocurrency = Cryptocurrency.new(cryptocurrency_params)
    if @cryptocurrency.save 
      redirect_to @cryptocurrency, notice: 'Criptomoeda atualizada com sucesso'
    else 
      render :edit
    end
  end

  def destroy
    @cryptocurrency.destroy
    redirect_to cryptocurrencies_url, notice: 'Criptomoeda removida com sucesso'
  end

  private

  def set_cryptocurrency
    @cryptocurrency = Cryptocurrency.find(params[:id])
  end

  def cryptocurrency_params
    params.require(:cryptocurrency).permit(:name, :company, :description, :photo, :value)
  end  
end
