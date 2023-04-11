class Article < ApplicationRecord

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :article_image



  def get_article_image
    (article_image.attached?) ? article_image : 'no_image.jpg'
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
