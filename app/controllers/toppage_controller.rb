class ToppageController < ApplicationController
  def index
    mens = Category.find(1)
    @mens = mens.goods.first(10)
  end

  def search
    @goods = Good.search(params[:keyword])
    @category = Category.search(params[:keyword])
    @brand_goods = Brand.search(params[:keyword])

  end
end
