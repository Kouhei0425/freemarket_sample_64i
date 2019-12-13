class BuysController < ApplicationController

  def index
    @good = Good.find(params[:good_id])
    @address = Address.where( user_id: current_user.id)[0]
    @buy = Buy.new
    @buy_address = @buy.buy_addresses.build
  end

  def create
    buy = Buy.create(buy_params)
    if buy.save
      BuyAddress.create(post: params[:buy_address][:post], prefecture: params[:buy_address][:prefecture], city: params[:buy_address][:city],
      address: params[:buy_address][:address], buil: params[:buy_address][:buil], buy_id: buy.id )
    end
  end

  private
  def buy_params
    params.require(:buy).permit(:good_id, :user_id, :price, buy_addresses_attributes: [:buy_address], buy_credit_attributes: [:buy_credit] )
  end
end
