class Customer::GalleriesController < ApplicationController

  def index
    @creator = Creator.find(params[:creator_id])
    @galleries = @creator.galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

end
