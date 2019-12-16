class BuysController < ApplicationController

  def index
    @good = Good.find(params[:good_id])
    @address = Address.where(user_id: current_user.id)[0]
    @buy = Buy.new
    @buy.buy_addresses.build
  end

  def create
    @buy = Buy.new(buy_params)
    if @buy.save
      buy_address = params[:buy][:buy_addresses_attributes][:'0']
      BuyAddress.create(post: buy_address[:post], prefecture: buy_address[:prefecture], city: buy_address[:city],
      address: buy_address[:address], buil: buy_address[:buil], buy_id: @buy.id )
    end
  end

  private
  def buy_params
    params.require(:buy).permit(:good_id, :user_id, :price, :buy_addresses_attributes, :buy_credit_attributes )
  end
end
