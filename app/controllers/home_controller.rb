class HomeController < ApplicationController
  def index
    @option = Option.first(params[:number_per_page])
    @articles = Article.available.article_visible.order(date: :desc).page(params[:page]).per(@option.number_per_page)
    @article = Article.available.article_visible.display_evidence.order(date: :desc).limit(4)
    @categories = Category.order(:title)
    @pages = Page.page_visible.order(:title)
    @options = Option.all
    @links = Link.all
  end
end
