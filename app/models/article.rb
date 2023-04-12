class Article < ApplicationRecord

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :article_hashtags
  has_many :hashtags, through: :article_hashtags

  has_one_attached :article_image



  def get_article_image
    (article_image.attached?) ? article_image : 'no_image.jpg'
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  #   after_create do
  #   article = Article.find_by(id: id)
  #   hashtags  = caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   article.hashtags = []
  #   hashtags.uniq.map do |hashtag|
  #     #ハッシュタグは先頭の'#'を外した上で保存
  #     tag = Hashtag.find_or_create_by(name_tag: hashtag.downcase.delete('#'))
  #     article.hashtags << tag
  #   end
  # end

  # before_update do 
  #   article = Article.find_by(id: id)
  #   article.hashtags.clear
  #   hashtags = caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   hashtags.uniq.map do |hashtag|
  #     tag = Hashtag.find_or_create_by(name_tag: hashtag.downcase.delete('#'))
  #     photo.hashtags << tag
  #   end
  # end

end
