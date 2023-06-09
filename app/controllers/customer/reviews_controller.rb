class Customer::ReviewsController < ApplicationController

  before_action :authenticate_customer!

  def new
    @review = Review.new
    @reviews = Creator.find(params[:creator_id]).reviews.order(created_at: :desc).limit(5)
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.creator_id = params[:creator_id]
    if @review.save
      redirect_to creator_path(params[:creator_id])
    else
      redirect_to creator_path(params[:creator_id])
    end
  end


private
  def review_params
    params.require(:review).permit(:star, :comment)
  end

end
