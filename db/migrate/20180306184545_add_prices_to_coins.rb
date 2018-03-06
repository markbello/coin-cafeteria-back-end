class AddPricesToCoins < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :price_usd, :float
    add_column :coins, :price_btc, :float
  end
end
