class Public::ArticlesController < ApplicationController

 def new
   @article = Article.new
 end


  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    unless @article.article_image.attached?
     @article.article_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'no_image.jpg')), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    if @article.save
    #  tags = Vision.get_image_data(@article.article_image)
    #  tags.each do |tag|
    #  @article.tags.create(name: tag)
    # end
      redirect_to article_path(@article), notice: "投稿に成功しました"
    else
      @articles = Article.order(created_at: :desc).page(params[:page]).per(9)
      @user = current_user
      render "new"
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
    article = Article.find(params[:id])
    if article.update(article_params)
      redirect_to article_path(article), notice: "編集に成功しました"
    else
      render "edit"
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_path, notice: "削除に成功しました"
  end

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(name_tag: params[:name])
    @article = @tag.articles.order(created_at: :desc)
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
