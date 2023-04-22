class ArticleComment < ApplicationRecord

  validates :message,presence:true

  belongs_to :user
  belongs_to :article

end
