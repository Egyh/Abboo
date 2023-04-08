class Public::UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_correct_user, only: [:update]
  
  def index
    
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @article = Article.new
  end

  def edit
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def is_matching_login_user
    user_id = params[:id].to_i
    unless user_id == current_user.id
    redirect_to user_path(current_user)
    end
  end
end
