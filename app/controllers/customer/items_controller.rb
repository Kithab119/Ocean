class Customer::ItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @colors = Color.all
    @sizes = Size.all
    @genres = Genre.all
    @styles = Style.all
    if params[:color_id]
      color = Color.find(params[:color_id])
      @items = color.items
    elsif params[:size_id]
      size = Size.find(params[:size_id])
      @items = size.items
    elsif params[:genre_id]
      genre = Genre.find(params[:genre_id])
      @items = genre.items
    elsif params[:style_id]
      style = Style.find(params[:style_id])
      @items = style.items
    else
      @items = Item.looks(params[:word])
    end
  end

  def show
    @item =Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
