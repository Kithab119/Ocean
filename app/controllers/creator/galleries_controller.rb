class Creator::GalleriesController < ApplicationController

  before_action :authenticate_creator!

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.creator_id = current_creator.id
    @gallery.save
    redirect_to creator_galleries_path
  end

  def index
    @galleries = current_creator.galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to creator_galleries_path
  end


private
  def gallery_params
    params.require(:gallery).permit(:name, :overview, :address)
  end

end