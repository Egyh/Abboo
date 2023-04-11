class ArticleComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :articles
  
end
