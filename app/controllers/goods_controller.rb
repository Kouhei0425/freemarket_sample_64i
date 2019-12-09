class GoodsController < ApplicationController
  def show
    @image = Image.find(params[:id])
    @brand = Brand.find(params[:id])
    @area = Area.find(parames[:id])
    @good = Good.find(params[:id])
    @user = User.find(params[:id])
    @category = Category.find(params[:id])
    @children = @category.children
    @parent = @category.parent
  end
  
  def new
    @good = Good.new
  end

  def create
    
  end
  
end
