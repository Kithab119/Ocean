class Customer::FollowsController < ApplicationController

  def create
    @follow = Follow.new
    @follow.customer_id = current_customer.id
    @follow.creator_id = params[:creator_id]
    @follow.save
    redirect_to creator_path(params[:creator_id])
  end

  def index
    @follows = current_customer.follows
  end

end
