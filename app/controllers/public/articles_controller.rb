class Public::ArticlesController < ApplicationController

 def new
   @article = Article.new
 end


  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article), notice: "You have created article successfully."
    else
      @articles = Article.order(created_at: :desc).page(params[:page]).per(9)
      @user = current_user
      render 'new'
    end
  end

  def index
    @articles = Article.order(created_at: :desc).page(params[:page]).per(9)
    @arttile = Article.new
    @user = current_user
  end

  def show
    @article = Article.find(params[:id])
    @user = current_user
    @article_comment = ArticleComment.new
  end

  def edit
     @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "You have updated article successfully."
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(name_tag: params[:name])
    @article = @tag.articles
    @articles = Article.order(created_at: :desc).page(params[:page]).per(9)

  end

  private
  def article_params
    #byebug
    params.require(:article).permit(:title, :body, :article_image, :latitude, :longitude)
  end

  def is_matching_login_user
  article = Article.find(params[:id])
  user_id = article.user_id
  unless user_id == current_user.id
      redirect_to articles_path
  end
  end
end
