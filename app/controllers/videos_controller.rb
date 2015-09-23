class VideosController < ApplicationController
  def index
    @categories = Category.all.includes(:videos)
  end

  def show
    @video = Video.find(params[:id])
  end

  def search
    @result = Video.search_by_title(params[:search_term])
  end
end
