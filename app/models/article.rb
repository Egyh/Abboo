class Article < ApplicationRecord

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :article_hashtags
  has_many :hashtags, through: :article_hashtags
  has_many :tags, dependent: :destroy

  has_one_attached :article_image



  def get_article_image
    (article_image.attached?) ? article_image : "no_image.jpg"
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

    after_create do
    article = Article.find_by(id: id)
    hashtags  = body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    article.hashtags = []
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(name_tag: hashtag.downcase.delete("#"))
      article.hashtags << tag
    end
  end

  before_update do
    article = Article.find_by(id: id)
    article.hashtags.clear
    hashtags = body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(name_tag: hashtag.downcase.delete("#"))
      article.hashtags << tag
    end
  end

  def get_latitude
    return 35.6877479 if self.latitude == nil
    return self.latitude
  end

  def get_longitude
    return 139.7676993 if self.longitude == nil
    return self.longitude
  end

 def self.looks(word)
    # if search == "perfect_match"
    #   @article = Article.where("title LIKE?","#{word}")
    # elsif search == "forward_match"
    #   @article = Article.where("title LIKE?","#{word}%")
    # elsif search == "backward_match"
    #    @article = Article.where("title LIKE?","%#{word}")
    # elsif search == "partial_match"
      @article = Article.where("title LIKE?","%#{word}%")
    # else
    #   @article = Article.all
    # end
 end
end
