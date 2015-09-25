class HomeController < ApplicationController
  def index
    @articles = Article.available.all.order(date: :desc).page(params[:page]).per(2)
    @article = Article.available.all.order(date: :desc).limit(4).offset(0)
    @categories = Category.all.order(:title)
    @pages = Page.all.order(:title)
    @options = Option.all
  end

end
