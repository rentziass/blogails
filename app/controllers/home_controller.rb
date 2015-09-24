class HomeController < ApplicationController

  def index
    @articles = Article.available.all.order(date: :desc)
    @categories = Category.all
    @pages = Page.all
    @options = Option.all
  end

end
