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

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = 'Article was created successfully'
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article was update successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_path }
      format.json { head :no_content }
    end
  end
end
