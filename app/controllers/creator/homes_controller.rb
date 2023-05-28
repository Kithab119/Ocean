class Creator::HomesController < ApplicationController

  before_action :authenticate_creator!

  def top
    @creator = current_creator
    @items = current_creator.items.order(created_at: :desc).limit(6)
  end

end
