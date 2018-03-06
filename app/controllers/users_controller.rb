class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user, status: 200
  end

  def create
    @user = User.new(username: params[:username], password: params[:password])
    if @user.valid?
      @user.save
      token = issue_token({ 'user_id': @user.id})
      render json: {'token': token }
    else
      render json: {'error': 'Username already exists! Try again.'}
    end
  end

  def add_favorite
    coin = params["coins"]
    coin_object = Coin.find_or_create_by(symbol: coin)
    @user = User.find(params[:id])
    if !@user.coins.include?(coin_object)
      @user.coins << coin_object
    end
    render json: @user
  end

  def remove_favorite
    coin = params["coins"]
    coin_object = Coin.find_or_create_by(symbol: coin)
    @user = User.find(params[:id])
    if @user.coins.include?(coin_object)
      @user.coins.delete(coin_object)
    end
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
