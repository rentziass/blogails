class TinymceAssetsController < ApplicationController
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed

    render json: {
      image: {
        url: view_context.image_url(params[:file])
      }
    }, content_type: "text/html"
  end
end
