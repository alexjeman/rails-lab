class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :require_user, only: %i[edit update]
  before_action :require_same_user, only: %i[edit update]

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def show
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit(:username, :email, :password))
      flash[:notice] = 'Account updated!'
      redirect_to @user, notice: 'Account information was successfully updated.'
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_index_path, notice: 'User was successfully created.'
    else
      render 'new'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
