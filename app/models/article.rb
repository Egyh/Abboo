class Article < ApplicationRecord

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  belongs_to :user

  has_one_attached :article_image



  def get_article_image
    (article_image.attached?) ? article_image : 'no_image.jpg'
  end

end
