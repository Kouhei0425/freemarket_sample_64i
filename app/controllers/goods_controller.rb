class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
  end
  
  def new
    @good = Good.new
    @good.images.build
    @good.category_goods.build
  end

  def create
    @good = Good.create(good_params)
    if @good.save
      params[:images][:image].each do |image|
        Image.create(image: image, good_id: @good.id )
      end
      params[:category_goods][:category_id].each do |category_id|
        Category_good.create(good_id: @good.id, category_id: category_id)
      end
    end
    redirect_to root_path
  end
  
  private
  def good_params
    params.require(:good).permit(:name, :explain, :size, :price, :method, :ship, :burden, :status, :brand_id, :area_id, :user_id, images_attribute: [:image], category_goods_attribute: [:category_id])
  end
end

