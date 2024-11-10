class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:word])
    else
      @articles = Article.looks(params[:word])
    end
  end
end
