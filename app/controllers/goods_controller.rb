class GoodsController < ApplicationController
  def show
    @good = Good.find(params[:id])
  end
  
  def new
    @good = Good.new
    @good.good_images.build
  end

  def create
    @good = Good.create(good_params)
    if @good.save
      params[:images][:image].each do |image|
        Image.new(image: image, good_id: @good.id )
      end
      params[:categories][:category_id].each do |category_id|
        Category_good.new(good_id: @good.id, category_id: category_id)
    end
  end
  
  private
  def good_params
    params.require(:good).permit(:name, :explain, :size, :price, :method, :ship, images_attribute: [:image], categories_attribute: [:category_id])
  end
end
