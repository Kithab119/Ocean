class Admin::CreatorsController < ApplicationController

  before_action :authenticate_admin!

  def show
    @creator = Creator.find(params[:id])
  end

  def edit
    @creator = Creator.find(params[:id])
  end

  def update
    @creator = Creator.find(params[:id])
    @creator.update(creator_params)
    redirect_to admin_creator_path(@creator.id)
  end


private
  def creator_params
    params.require(:creator).permit(:name, :profile, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end
