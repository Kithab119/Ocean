class Admin::StylesController < ApplicationController

  before_action :authenticate_admin!

  def index
    @styles = Style.all
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    @style.save
    redirect_to admin_styles_path
  end

  def destroy
    @style = Style.find(params[:id])
    @style.destroy
    redirect_to admin_styles_path
  end


private
  def style_params
    params.require(:style).permit(:where)
  end

end
