class CoinsController < ApplicationController

  after_action :update_coins

  def index
    @coins = Coin.all
    render json:@coins
  end

  def show
    @coin = Coin.find_by(id: params[:id])
    render json:@coin
  end

  def create
    @coin = Coin.create(coin_params)
    render json:@coin
  end

  def update
    @coin = Coin.find(params[:id])
    @coin.update(coin_params)
    render json:@coin
  end

  def destroy
    @coin = Coin.find(params[:id])
    @coin.destroy
    render json: {message: "Removed From Favorite!"}
  end

  private

  def update_coins
    top100_raw = open("https://api.coinmarketcap.com/v1/ticker/").read
    top100= JSON.parse(top100_raw)

    top100.each do |coin|
      newCoin = Coin.find_or_create_by(symbol: coin["symbol"])
      newCoin.coin_market_cap_id = coin["id"]
      newCoin.name = coin["name"]
      newCoin.symbol = coin["symbol"]
      newCoin.rank = coin["rank"]
      newCoin.price_usd= coin["price_usd"]
      newCoin.price_btc= coin["price_btc"]
      newCoin.volume_usd= coin["24h_volume_usd"]
      newCoin.market_cap_usd= coin["market_cap_usd"]
      newCoin.available_supply= coin["available_supply"]
      newCoin.total_supply= coin["total_supply"]
      newCoin.max_supply= coin["max_supply"]
      newCoin.percent_change_1h= coin["percent_change_1h"]
      newCoin.percent_change_24h= coin["percent_change_24h"]
      newCoin.percent_change_7d= coin["percent_change_7d"]
      newCoin.last_updated= coin["last_updated"]
      puts coin["last_updated"]
      newCoin.save
      puts newCoin
      # puts JSON.parse(coin)
    end
  end

  def coin_params
    params.require(:coin).permit(:symbol)
  end

end
