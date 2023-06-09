class Customer::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @cart_item = CartItem.new(cart_item_params)
    unless current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    redirect_to cart_items_path
  end


private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id)
  end

end
