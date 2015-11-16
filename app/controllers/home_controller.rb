class HomeController < ApplicationController
  def index
    @option = Option.first(params[:number_per_page])
    @articles = Article.available.visible.order(date: :desc).page(params[:page]).per(@option.number_per_page)
  end
end
