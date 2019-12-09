class GoodsController < ApplicationController
  def show

  end
  
  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
  end

  private

  def good_params
    params.require(:good).permit(:, {image: []})
  end

  
end
 