class CoinsController < ApplicationController

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

  def coin_params
    params.require(:coin).permit(:symbol)
  end

end
