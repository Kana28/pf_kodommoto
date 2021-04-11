class UsersController < ApplicationController

  def index
    @users = User.all
    @article = Article.new
    @articles = Article.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
