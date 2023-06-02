class Admin::HomesController < ApplicationController
before_action :authenticate_admin!

def top
    @articles = Article.all
    @today_article =  @articles.created_today
    @yesterday_article = @articles.created_yesterday
    @this_week_article = @articles.created_this_week
    @last_week_article = @articles.created_last_week

end

end
