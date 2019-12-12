class ToppageController < ApplicationController
  def index
    @ladies = Category.find(1)
    @ladies_goods = @ladies.goods
    @mens = Category.find(2)
    @mens_goods = @mens.goods
    @electronics = Category.find(8)
    @electronics_goods = @electronics.goods
    @hobbies = Category.find(6)
    @hobbies_goods = @hobbies.goods
    @chanel = Brand.find(1)
    @chanel_goods = @chanel.goods
    @louis = Brand.find(3)
    @louis_goods = @louis.goods
    @nike = Brand.find(2)
    @nike_goods = @nike.goods
    @supreme = Brand.find(4)
    @supreme_goods = @supreme.goods
    
  end

  def search
    @goods = Good.search(params[:keyword])
    @category = Category.search(params[:keyword])
    @brand_goods = Brand.search(params[:keyword])
  end
end
