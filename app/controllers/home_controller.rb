class HomeController < ApplicationController
  def index
    @option = Option.first(params[:number_per_page])
    @articles = Article.available.all.order(date: :desc).page(params[:page]).per(@option.number_per_page)
    @article = Article.available.all.order(date: :desc).limit(4).offset(0)
    @categories = Category.all.order(:title)
    @pages = Page.all.order(:title)
    @options = Option.all
    @links = Link.all
  end

end
