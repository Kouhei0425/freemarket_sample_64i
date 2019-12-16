class SignupController < ApplicationController

  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_kana] = user_params[:family_kana]
    session[:first_kana] = user_params[:first_kana]
    session[:birsday_year] = user_params[:birsday_year]
    session[:birsday_month] = user_params[:birsday_month]
    session[:birthday_date] = user_params[:birthday_date]
    @user = User.new
  end

  def step3
    session[:phone_number] = user_params[:phone_number]
    @user = User.new 
  end

  def step4
    session[:post] = user_params[:post]
    session[:prefecture] = user_params[:prefecture]
    session[:city] = user_params[:city]
    session[:address] = user_params[:address]
    session[:buil] = user_params[:buil]
    @user = User.new
    @user.addresses.build
  end

  def done
    session[:number] = user_params[:number]
    session[:type] = user_params[:type]
    session[:month] = user_params[:month]
    session[:year] = user_params[:year]
    session[:security] = user_params[:security]
    @user = User.new
    @user.credits.build
  end
  
  def create
    @user = User.new(
    #1ページ目で入力したデータ
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name],
    first_name: session[:first_name],
    family_kana: session[:family_kana],
    first_kana: session[:first_kana],
    birsday_year: session[:birsday_year],
    birsday_month: session[:birsday_month],
    birthday_date: session[:birthday_date],

    phone_number: session[:phone_number],

    post: session[:post],
    prefecture: session[:prefecture],
    city: session[:city],
    address: session[:address],
    buil: session[:buil],

    number: user_params[:number],
    type: user_params[:type],
    month: user_params[:month],
    year: user_params[:year],
    security: user_params[:security]
    )
  end
  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :family_name, 
      :first_name, :family_kana, :first_kana, :birsday_year, :birsday_month, :birthday_date, :phone_number,address_attributes:[:post, :prefecture, :city, :address, :buil ],credits_attributes:[:number,:type,:month,:year,:security]
  )
  end

end

