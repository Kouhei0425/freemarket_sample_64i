class ToppageController < ApplicationController
  def index
    mens = Category.find(1)
    @mens = mens.goods
    ladies = Category.find(2)
    @ladies = ladies.goods
    
  end

  def search
    @goods = Good.search(params[:keyword])
    @category = Category.search(params[:keyword])
    @brand_goods = Brand.search(params[:keyword])
  end
end
