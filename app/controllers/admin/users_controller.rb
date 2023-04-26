class Admin::UsersController < ApplicationController

  def index
    @users = User.page(params[:page])
    @article = Article.new

  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page])
    @article = Article.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user =  User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "更新に成功しました"
    else
      render :edit
    end
  end

  def withdrawal
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :country_code, :abroad_record, :purpose, :period, :is_deleted)
  end



end
