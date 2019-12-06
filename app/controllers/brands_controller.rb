class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @goods = @brand.goods
  end
  
end
