class ArticlesController < ApplicationController

  def index
    @article = Article.new
    @articles = Article.page(params[:page]).per(4)
    @users = User.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    if article.save
      redirect_to article_path(article.id)
    else
      render :index #投稿がうまくいかなかった場合に
    end
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
