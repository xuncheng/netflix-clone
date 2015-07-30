class VideosController < ApplicationController
  def index
    @categories = Category.all.includes(:videos)
  end
end
