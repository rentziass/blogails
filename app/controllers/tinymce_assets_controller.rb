class TinymceAssetsController < ApplicationController
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed

    article_image = ArticleImage.create(image: params[:file])

    render json: {
      image: {
        :url => article_image.image.url,
        height: 100
      }
    }, content_type: "text/html"
  end
end
