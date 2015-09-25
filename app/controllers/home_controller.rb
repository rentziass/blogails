class HomeController < ApplicationController
  def index
    @articles = Article.available.all.order(date: :desc).page(params[:page]).per(2)
    @categories = Category.all.order(:title)
    @pages = Page.all.order(:title)
    @options = Option.all
  end

end
