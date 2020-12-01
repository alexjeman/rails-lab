class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      flash[:alert] = 'You must be logged in to perform that action.'
      redirect_to login_path
    end
  end

  def require_article_author
    unless current_user == @article.user
      flash[:alert] = 'You can only edit or delete your own articles.'
      redirect_to @article
    end
  end

  def require_same_user
    if current_user != @user
      flash[:alert] = 'You can only edit your own account.'
      redirect_to @user
    end
  end
end
