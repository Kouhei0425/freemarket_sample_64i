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
    @address = Address.new
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
    if @user.save
      @address = Address.create( 
        family_name: address_params[:family_name],
        first_name: address_params[:first_name],
        family_kana: address_params[:family_kana],
        first_kana: address_params[:first_kana],
        post: address_params[:post],
        prefecture: address_params[:prefecture],
        city: address_params[:city],
        address: address_params[:address],
        buil: address_params[:buil],
        phone_number: address_params[:phone_number],
        user_id: @user.id
      )
      unless @address.save
        redirect_to step3_signup_index_path
        flash.now[:alert] = '登録情報の記入に間違いがある可能性があります'
      end
      sign_in User.find(@user.id) 
    else
      flash.now[:alert] = '登録情報の記入に間違いがある可能性があります'
      redirect_to step1_signup_index_path
    end
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
      :phone_number
    )
  end

  def address_params
    params.require(:address).permit(
      :family_name,
      :first_name,
      :family_kana,
      :first_kana,
      :phone_number,
      :post,
      :prefecture,
      :city,
      :address,
      :buil,
      :phone_number
    )
  end

end
