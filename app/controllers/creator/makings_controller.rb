class Creator::MakingsController < ApplicationController

  before_action :authenticate_creator!

  def index
    @makings = current_creator.makings
  end

  def show
    @making = Making.find(params[:id])
  end

  def update
    @making = Making.find(params[:id])
    @making.update(making_params)
    redirect_to creator_making_path(@making.id)
  end


private
  def making_params
    params.require(:making).permit(:is_product)
  end

end
