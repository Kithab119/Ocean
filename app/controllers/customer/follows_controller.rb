class Customer::FollowsController < ApplicationController
  
  before_action :authenticate_customer!

  def create
    @follow = Follow.new
    unless current_customer.follows.find_by(creator_id: params[:creator_id])
      @follow.customer_id = current_customer.id
      @follow.creator_id = params[:creator_id]
      @follow.save
      flash[:follow] = "フォローしました！"
    end
    redirect_to creator_path(params[:creator_id])
  end

  def index
    @follows = current_customer.follows
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to follows_path
  end

end
