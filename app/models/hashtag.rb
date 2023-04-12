class Hashtag < ApplicationRecord

  validates :name_tag, presence: true, length: { maximum:99}

  has_many :article_hashtags
  has_many :articles, through: :article_hashtags
end
