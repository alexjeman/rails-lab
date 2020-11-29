class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:username, :email, :password))
      flash[:notice] = 'Account updated!'
      redirect @user, notice: 'Account information was successfully updated.'
    else
      render 'edit'
    end
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
