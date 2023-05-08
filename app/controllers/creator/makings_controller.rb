class Creator::MakingsController < ApplicationController

  before_action :authenticate_creator!

  def index
    @makings = current_creator.makings
  end

end
