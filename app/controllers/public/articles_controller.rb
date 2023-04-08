class Public::ArticlesController < ApplicationController
  def new
    @arttile = Article.new
  end
  
  def create 
    @article = Article.new(article_params)
    # @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article), notice: "You have created book successfully."
    else
      @article = Article.all
      render 'index'
    end
  end

  def index
    @articles = Articles.all
  
  end

  def show
  end

  def edit
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :body, :image)  
  end
end
