class Customer::CreatorsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @creators = Creator.all
  end

  def show
    @creator = Creator.find(params[:id])
  end

end
