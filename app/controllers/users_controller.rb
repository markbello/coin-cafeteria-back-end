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
    @user = User.create(user_params)
    render json:@user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json:@user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "Removed From Favorite!"}
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
