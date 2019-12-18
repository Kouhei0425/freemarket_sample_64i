class SignupController < ApplicationController
  
  require "payjp"
  
  def step1
    #新規インスタンス作成
    @user = User.new
  end

  def step2
    
    session[:nick_name] = user_params[:nick_name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_kana] = user_params[:family_kana]
    session[:first_kana] = user_params[:first_kana]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_date] = user_params[:birthday_date]

    @user = User.new
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    
    @user = User.new
    @credit = Credit.new
    @user.build_address
  end

  def step4
    @user = User.create(
      nick_name: session[:nick_name],
      email: session[:email],
      password: session[:password],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_kana: session[:family_kana],
      first_kana: session[:first_kana],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_date: session[:birthday_date],
      phone_number: session[:phone_number]
    )
    Address.create( 
      post: user_params[:address_attributes][:post],
      prefecture: user_params[:address_attributes][:prefecture],
      city: user_params[:address_attributes][:city],
      address: user_params[:address_attributes][:address],
      buil: user_params[:address_attributes][:buil],
      user_id: @user.id
    )
    sign_in User.find(@user.id) 
  end
  
  def done
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to step4_signup_index_path
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      )
      @card = Credit.create(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
      else
        redirect_to step4_signup_index_path
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
  end

  def create
    
  end

  private

  def user_params
    params.require(:user).permit(
      :nick_name,
      :email,
      :password,
      :family_name,
      :first_name,
      :family_kana,
      :first_kana,
      :birthday_year,
      :birthday_month,
      :birthday_date,
      :phone_number,
      address_attributes: [:post,:prefecture,:city,:address,:buil]
    )
  end
end
