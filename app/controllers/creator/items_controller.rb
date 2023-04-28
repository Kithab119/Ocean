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
    redirect_to creator_items_path
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


private
  def item_params
    params.require(:item).permit(:creator_id, :color_id, :size_id, :genre_id, :style_id, :name, :introduction, :price, :is_active)
  end

end
