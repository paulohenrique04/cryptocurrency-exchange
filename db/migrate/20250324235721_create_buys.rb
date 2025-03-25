class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cryptocurrency, null: false, foreign_key: true
      t.decimal :quantity
      t.decimal :crypto_value

      t.timestamps
    end
  end
end
