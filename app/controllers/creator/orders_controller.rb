class Creator::OrdersController < ApplicationController

  def index
    @orders = current_creator.orders
  end

end
