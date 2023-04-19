class Admin::ArticlesController < ApplicationController

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
     pp "###################################"
     @article = Article.find(params[:id])
     pp @article
  end

  def update
    @article = Article.find(params[:id])
    pp "============"
    pp @article
    if @article.update(article_params)
      redirect_to admin_article_path(@article), notice: "You have updated book successfully."
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
