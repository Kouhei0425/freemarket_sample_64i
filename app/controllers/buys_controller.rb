class BuysController < ApplicationController
  require 'payjp'

  def index
    @good = Good.find(params[:good_id])
    @address = Address.where(user_id: current_user.id)[0]
    @buy = Buy.new
    @buy.buy_addresses.build

    credit = Credit.where(user_id: current_user.id).first
    if credit.blank?
      redirect_to root_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(credit.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(credit.card_id)
    end
  end

  def create
    credit = Credit.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => buy_params[:price],
    :customer => credit.customer_id, #顧客ID
    :currency => 'jpy' #日本円
  )
    @buy = Buy.new(buy_params)
    if @buy.save
      buy_address = params[:buy][:buy_addresses_attributes][:'0']
      BuyAddress.create(post: buy_address[:post], prefecture: buy_address[:prefecture], city: buy_address[:city],
      address: buy_address[:address], buil: buy_address[:buil], buy_id: @buy.id )
      redirect_to root_path
    end
  end

  private
  def buy_params
    params.require(:buy).permit(:good_id, :user_id, :price, :buy_addresses_attributes, :buy_credits_attributes )
  end
end
