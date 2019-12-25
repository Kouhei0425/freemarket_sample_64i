class ToppageController < ApplicationController
  def index
    @ladies = Category.find(1)
    @ladies_goods = @ladies.goods.order("created_at DESC").first(10)
    @mens = Category.find(2)
    @mens_goods = @mens.goods.order("created_at DESC").first(10)
    @electronics = Category.find(8)
    @electronics_goods = @electronics.goods.order("created_at DESC").first(10)
    @hobbies = Category.find(6)
    @hobbies_goods = @hobbies.goods.order("created_at DESC").first(10)
    @chanel = Brand.find(1)
    @chanel_goods = @chanel.goods.order("created_at DESC").first(10)
    @louis = Brand.find(3)
    @louis_goods = @louis.goods.order("created_at DESC").first(10)
    @nike = Brand.find(2)
    @nike_goods = @nike.goods.order("created_at DESC").first(10)
    @supreme = Brand.find(4)
    @supreme_goods = @supreme.goods.order("created_at DESC").first(10)

    @children = Category.where( parent_id: params[:parent_id] )
    respond_to do |format|
      format.html
      format.json { render json: @children}
    end
  end

  def search
    @goods = Good.search(params[:keyword])
  end
end
