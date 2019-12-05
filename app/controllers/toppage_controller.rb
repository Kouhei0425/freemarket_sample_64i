class ToppageController < ApplicationController
  def index
  end

  def search
    @goods = Good.search(params[:keyword])
    @category = Category.search(params[:keyword])
    @brand_goods = Brand.search(params[:keyword])

  end
end
