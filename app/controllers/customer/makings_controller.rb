class Customer::MakingsController < ApplicationController

  before_action :authenticate_customer!

  def new
    @making = Making.new
  end

  def create
    @making = Making.new(making_params)
    @making.customer_id = current_customer.id
    @making.creator_id = params[:creator_id]
    if params[:making][:size_select] == "0"
      @making.size = "#{params[:making][:size_option1]}#{params[:making][:size_option2]}号"
    else
      @making.size = "#{params[:making][:size_y]}x#{params[:making][:size_x]}"
    end
    @making.save
    redirect_to creator_makings_path(@making.creator_id)
  end

  def index
    @makings = current_customer.makings
  end

  def show
    @making = Making.find(params[:id])
  end


private
  def making_params
    params.require(:making).permit(:color, :genre, :style, :request, :price)
  end

end
