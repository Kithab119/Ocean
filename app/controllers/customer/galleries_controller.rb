class Customer::GalleriesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @creator = Creator.find(params[:creator_id])
    @galleries = @creator.galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

end
