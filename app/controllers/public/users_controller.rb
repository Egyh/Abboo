class Public::UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.page(params[:page])
    @article = Article.new

  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.all.order(created_at: :desc)
    @articles = Kaminari.paginate_array(@articles).page(params[:page]).per(8)
    @article = Article.new
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
      user =  User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user), notice: "更新に成功しました"
    else
      render :edit
    end
  end

  def withdrawal
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end

  def favorites
    @user =  User.find(params[:id])
    @favorite_articles = Article.joins(:favorites).where(favorites: {user_id: @user.id}).order(created_at: :desc).page(params[:page]).per(9)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :country_code, :abroad_record, :purpose, :period,)
  end

  def is_matching_login_user
    redirect_to user_path(current_user) unless params[:id].to_i == current_user.id
    end
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
end