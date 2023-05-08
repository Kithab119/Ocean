class Customer::HomesController < ApplicationController

  def top
    @colors = Color.all
    @sizes = Size.all
    @genres = Genre.all
    @styles = Style.all
  end

  def about
  end

end
