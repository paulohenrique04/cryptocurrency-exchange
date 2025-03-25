class HomeController < ApplicationController
  def index
    @cryptocurrencies = Cryptocurrency.all
  end
end
