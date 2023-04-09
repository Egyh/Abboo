class Public::ArticlesController < ApplicationController
  
 def new
   @arttile = Article.new
 end
    

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article), notice: "You have created article successfully."
    else
      @article = Article.all
      render 'index'
    end
  end

  def index
    @articles = Article.all
    @arttile = Article.new
    @user = current_user
  end

  def show
  end

  def edit
  end

  private
  def article_params
    #byebug
    #params.require(:article).permit(:title, :body, :article_image)
    params.permit(:title, :body, :article_image)
  end

  def is_matching_login_user
  article = Article.find(params[:id])
  user_id = article.user_id
  unless user_id == current_user.id
      redirect_to articles_path
  end
  end
end
