class Customer::CreatorsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @creators = Creator.all
  end

  def show
    @creator = Creator.find(params[:id])
  end

  def update
    @creator = Creator.find(params[:id])
    @creator.update(creator_params)
    redirect_to creator_path(@creator.id)
  end


private
  def creator_params
    params.require(:creator).permit(:star)
  end

end
