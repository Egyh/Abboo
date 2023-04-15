module Public::ArticlesHelper
  
  def render_with_hashtags(body)
    body.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/article/hashtag/#{word.delete("#").delete("＃")}"}.html_safe
  end 
end
