class BuysController < ApplicationController

  def index
    @good = Good.find(params[:good_id])
  end

  def create
    Buy.create(buy_params)
  end
  private
  def buy_params
    params.require(:buy).permit(:good_id, :user_id, :price, buy_address_attribute: [:buy_address], buy_credit_attribute: [:buy_credit] )
  end
end
