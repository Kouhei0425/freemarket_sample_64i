class BuysController < ApplicationController
  def index
    @good = Good.find(params[:good_id])
  end
  def create
    buy.create(buy_params)
  end
  private
  def buy_params
    params.require(:buy).permit(:good_id, :user_id, :price)
  end
end
