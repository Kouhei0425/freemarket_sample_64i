class CreditsController < ApplicationController

  require "payjp"

  
  def pay #データベース作成
    Payjp.api_key = ENV["sk_test_605a7c3b85b5bd3e70552922"]
    if params['payjp-token'].blank?
      redirect_to step4_signup_index_path
    else
      ##ここでuserを保存する(あとでdoneに移す)
      ##user = User.create()
      ##if user.save
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Credit.new(user_id: user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to done_signup_index_path
      else
        redirect_to step4_signup_index_path
      end
    end
  end

  def delete #データベースを削除
    card = Credit.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["sk_test_605a7c3b85b5bd3e70552922"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show #データpayjpに送り情報を取り出し
    card = Credit.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["sk_test_605a7c3b85b5bd3e70552922"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
