class UserCoinsController < ApplicationController

  def index
    @user_coins = UserCoin.all
    render json:@user_coins
  end

  def show
    @user_coins = UserCoin.find_by(id: params[:id])
    render json:@user_coins
  end

  def create
    @user_coins = UserCoin.create(user_coins_params)
    render json:@user_coins
  end

  def update
    @user_coins = UserCoin.find(params[:id])
    @user_coins.update(user_coins_params)
    render json:@user_coins
  end

  def destroy
    @user_coins = UserCoin.find(params[:id])
    @user_coins.destroy
    render json: {message: "Removed From Favorite!"}
  end

  private

  def user_coins_params
    params.require(:user_coins).permit(:symbol)
  end

end
