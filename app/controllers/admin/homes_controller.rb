class Admin::HomesController < ApplicationController

  def top
    @creators = Creator.all
  end

end
