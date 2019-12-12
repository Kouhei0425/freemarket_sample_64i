class ToppageController < ApplicationController
  def index
    @ladies = Category.find(1)
    @ladies_goods = @ladies.goods.first(10)
    @mens = Category.find(2)
    @mens_goods = @mens.goods.first(10)
    @electronics = Category.find(8)
    @electronics_goods = @electronics.goods.first(10)
    @hobbies = Category.find(6)
    @hobbies_goods = @hobbies.goods.first(10)
    @chanel = Brand.find(1)
    @chanel_goods = @chanel.goods.first(10)
    @louis = Brand.find(3)
    @louis_goods = @louis.goods.first(10)
    @nike = Brand.find(2)
    @nike_goods = @nike.goods.first(10)
    @supreme = Brand.find(4)
    @supreme_goods = @supreme.goods.first(10)
    
  end

  def search
    @goods = Good.search(params[:keyword])
    @category = Category.search(params[:keyword])
    @brand_goods = Brand.search(params[:keyword])
  end
end
