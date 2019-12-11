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
    binding.pry
    @good = Good.new(good_params)
    if @good.save
      params[:images][:image].each do |image|
        Image.create(image: image, good_id: @good.id )
      end
      params[:category_ids][:category_id].each do |category_id|
        CategoryGood.create(category_id: category_id, good_id: @good.id)
      end
      redirect_to root_path
    end
  end
  
  private
  def good_params
    params.require(:good).permit(:name, :explain, :size, :price, :method, :ship, :burden, :status, :brand_id, :area_id, :user_id, images_attribute: [:image], category_ids: [])
  end
end

