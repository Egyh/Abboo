class Public::UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_correct_user, only: [:update]
  
  def index
    @users = User.all
    @article = Article.new
    
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @article = Article.new
  end

  def edit
     @user = User.find(params[:id])
  end
  
  def update
      @user =  User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  
  
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :country_code, :abroad_record, :purpose, :period,)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
    redirect_to user_path(current_user)
    end
  end
end