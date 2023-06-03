class Customer::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def order_check
    @cart_items = current_customer.cart_items
    unless params[:order][:making_id] == ""
      @making_id = params[:order][:making_id]
      @making = Making.find(@making_id)
    end
    @sum = 0
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      address = Address.find_by(params[:order][:address_id])
      @order.shipping_postal_code = address.postal_code
      @order.shipping_address = address.address
      @order.shipping_name = address.name
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    unless params[:order][:making_id] == ""
      @making = Making.find(params[:order][:making_id])
      if @making.is_product == "approved"
        @making.update(order_id: @order.id, is_product: "product_waiting")
        @order.creator_id = @making.creator_id
        @order.save
      end
    else
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order.creator_id = cart_item.item.creator.id
        @order.save
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.order_id = @order.id
        @order_detail.purchase = cart_item.item.price
        @order_detail.save
      end
      @cart_items.destroy_all
    end
    redirect_to orders_order_finish_path
  end

  def order_finish
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @sum = 0
  end


private
  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :total_price, :payment, :is_receive)
  end

end
