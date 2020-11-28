class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password))
    if @user.save
      redirect_to home_index_path, notice: 'User was successfully created.'
    else
      render 'new'
    end
  end
end
