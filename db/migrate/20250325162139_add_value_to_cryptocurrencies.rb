class AddValueToCryptocurrencies < ActiveRecord::Migration[7.0]
  def change
    add_column :cryptocurrencies, :value, :decimal
  end
end
