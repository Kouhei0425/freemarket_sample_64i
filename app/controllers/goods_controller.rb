class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
  end
  
  def new
    @good = Good.new
  end

  def create
    Good.create(good_params)
  end
  
  private
  def good_params
    params.require(:good).permit(:name, :explain, :size, :price, :method, :ship, images_attribute: [])
  end
end
