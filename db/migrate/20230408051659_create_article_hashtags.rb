class CreateArticleHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :article_hashtags do |t|
t.integer"hashtag_id"
t.integer"article_id"
      t.timestamps
    end
  end
end
