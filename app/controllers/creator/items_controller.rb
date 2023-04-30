class Creator::ItemsController < ApplicationController

  def new
    @item = Item.new
    @colors = Color.all
    @sizes = Size.all
    @genres = Genre.all
    @styles = Style.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to creator_item_path(@item.id)
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to creator_item_path(@item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to creator_items_path
  end


private
  def item_params
    params.require(:item).permit(:creator_id, :color_id, :size_id, :genre_id, :style_id, :name, :introduction, :price, :is_active)
  end

end
