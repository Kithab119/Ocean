class Creator::CreatorsController < ApplicationController

  before_action :authenticate_creator!

  def show
    @creator = current_creator
  end

  def edit
    @creator = current_creator
  end

  def update
    @creator = current_creator
    if @creator.update(creator_params)
      redirect_to creator_creators_path
    else
      render :edit
    end
  end

  def out
  end

  def out_check
    @creator = current_creator
    @creator.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


private
  def creator_params
    params.require(:creator).permit(:name, :profile, :postal_code, :address, :telephone_number, :email, :profile_image)
  end

end
