class Customer::HomesController < ApplicationController

  def top
    @items = Item.all.first(6)
    @creators = Creator.all
    @colors = Color.all
    @sizes = Size.all
    @genres = Genre.all
    @styles = Style.all
  end

  def about
  end

end
