class Customer::ReviewsController < ApplicationController

  def new
    @review = Review.new
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
