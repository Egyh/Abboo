class Admin::ArticlesController < ApplicationController
 before_action :authenticate_admin!


  def index
    @articles = Article.order(created_at: :desc).page(params[:page]).per(9)
    @arttile = Article.new
    @user = current_user
  end

  def show
    @article = Article.find(params[:id])
    # @user = User.find(params[:id])
    @article_comment = ArticleComment.new
  end

  def edit
     @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: "更新に成功しました"
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end

   private
  def article_params
    #byebug
    params.require(:article).permit(:title, :body, :article_image, :latitude, :longitude)
  end

end
