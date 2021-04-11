class ArticlesController < ApplicationController
  def index
    @article = Article.new
    @articles = Article.page(params[:page]).per(6)
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    article = Article.new(article_params)
    article.save
    redirect_to article_path(article.id)
  end

  def edit
  end

  def update
  end


  private

  def article_params
    params.require(:article).permit(:user_id, :genre_id, :title, :body, :user_image)
  end
end
