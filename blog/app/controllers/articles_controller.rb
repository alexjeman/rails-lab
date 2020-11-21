class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @articles, status: :ok }
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @article, status: :ok }
    end
  end
end
