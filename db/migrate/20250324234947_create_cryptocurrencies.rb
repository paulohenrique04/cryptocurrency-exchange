class CreateCryptocurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :cryptocurrencies do |t|
      t.string :name
      t.string :company
      t.text :description

      t.timestamps
    end
  end
end
