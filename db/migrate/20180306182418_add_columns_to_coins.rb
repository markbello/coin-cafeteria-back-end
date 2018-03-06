class AddColumnsToCoins < ActiveRecord::Migration[5.1]
  def change
    add_column :coins, :coin_market_cap_id, :string
    add_column :coins, :name, :string
    add_column :coins, :string, :string
    add_column :coins, :rank, :integer
    add_column :coins, :volume_usd, :float
    add_column :coins, :market_cap_usd, :float
    add_column :coins, :available_supply, :float
    add_column :coins, :total_supply, :float
    add_column :coins, :max_supply, :float
    add_column :coins, :percent_change_1h, :float
    add_column :coins, :percent_change_24h, :float
    add_column :coins, :percent_change_7d, :float
    add_column :coins, :last_updated, :bigint
    add_column :coins, :score, :float
    add_column :coins, :sentiment, :string
  end
end
