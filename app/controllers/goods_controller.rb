class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
  end
  
  def new
    @good = Good.new
  end

  def create
    
  end
  
end
