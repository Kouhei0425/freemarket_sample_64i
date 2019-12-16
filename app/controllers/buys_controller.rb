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
      redirect_to root_path
      # BuyAddress.create(post: params[:buy_addresses][:post], prefecture: params[:buy_addresses][:prefecture], city: params[:buy_addresses][:city],
      # address: params[:buy_addresses][:address], buil: params[:buy_address][:buil], buy_id: buy.id )
    end
  end

  private
  def buy_params
    params.require(:buy).permit(:good_id, :user_id, :price, buy_addresses_attributes: [:id, :post, :city, :address, :buil], buy_credit_attributes: [] )
  end
end
