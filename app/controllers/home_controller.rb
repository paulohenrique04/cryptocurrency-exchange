class HomeController < ApplicationController
  def index
    @cryptocurrencies = Cryptocurrency.all

    if params[:search_term].present?
      filter_type = params[:filter_type] == 'description' ? 'description' : 'name'
      @cryptocurrencies = @cryptocurrencies.where("#{filter_type} LIKE ?", "%#{params[:search_term]}%")
    end
  end
end
