class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @article, status: :ok }
    end
  end
end
