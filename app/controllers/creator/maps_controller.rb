class Creator::MapsController < ApplicationController

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    @map.creator_id = current_creator.id
    @map.save!
    redirect_to creator_creators_path(current_creator.id)
  end


private
  def map_params
    params.require(:map).permit(:address)
  end

end
