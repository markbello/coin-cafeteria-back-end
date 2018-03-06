class CoinSerializer < ActiveModel::Serializer
  attributes :id, :symbol, :coin_market_cap_id, :name, :rank, :volume_usd, :market_cap_usd, :available_supply, :total_supply, :max_supply, :percent_change_1h, :percent_change_7d, :percent_change_24h, :last_updated, :score, :sentiment, :price_usd, :price_btc
end

# t.string "symbol"
# t.string "coin_market_cap_id"
# t.string "name"
# t.string "string"
# t.integer "rank"
# t.float "volume_usd"
# t.float "market_cap_usd"
# t.float "available_supply"
# t.float "total_supply"
# t.float "max_supply"
# t.float "percent_change_1h"
# t.float "percent_change_24h"
# t.float "percent_change_7d"
# t.bigint "last_updated"
# t.float "score"
# t.string "sentiment"
# t.float "price_usd"
# t.float "price_btc"
