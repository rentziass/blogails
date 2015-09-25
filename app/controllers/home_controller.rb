class HomeController < ApplicationController
  def index
    @articles = Article.available.all.order(date: :desc).page(params[:page]).per(@option)
    @article = Article.available.all.order(date: :desc).limit(4).offset(0)
    @categories = Category.all.order(:title)
    @pages = Page.all.order(:title)
    @option = Option.first(:number_per_page)
  end

end
