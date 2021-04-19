class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @article = Article.new
    @articles = Article.all

  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.reverse_order
  end

  def edit
    @user = User.find(params[:id])
    @users = User.all
    if current_user.id != @user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
