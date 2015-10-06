class ArticleImagesController < ApplicationController

  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    render json: {
      image: {
        url: ":s3_domain_url"
      }
    }
  end

end
