class Creator::GalleriesController < ApplicationController

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.creator_id = current_creator.id
    @gallery.save
    redirect_to creator_creators_path(current_creator.id)
  end


private
  def gallery_params
    params.require(:gallery).permit(:name, :overview, :address)
  end

end