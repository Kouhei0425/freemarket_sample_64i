class SignupController < ApplicationController

  def step1
    @user = User.new
  end

  def step2
    session[:nick_name] = user_params[:nick_name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
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
  end

  def step4
    address = params[:user][:address]
    session[:post] = address[:post]
    session[:prefecture] = address[:prefecture]
    session[:city] = address[:city]
    session[:address] = address[:address]
    session[:buil] = address[:buil]
    @user = User.new
    @user.addresses.build
    @credit = Credit.new
    
  end

  def done
    
    credit = params[:user][:credit]
    session[:number] = credit[:number]
    session[:type] = credit[:type]
    session[:month] = credit[:month]
    session[:year] = credit[:year]
    session[:security] = credit[:security]
    @user = User.new
    @user.credits.build
  end
  
  def create
    @user = User.create(

    nick_name: session[:nick_name],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name],
    first_name: session[:first_name],
    family_kana: session[:family_kana],
    first_kana: session[:first_kana],
    birthday_year: session[:birthday_year],
    birthday_month: session[:birthday_month],
    birthday_date: session[:birthday_date],
    phone_number: session[:phone_number],
    )
    Address.create(
    post: session[:post],
    prefecture: session[:prefecture],
    city: session[:city],
    address: session[:address],
    buil: session[:buil],
    )
    Credit.create(
    number: session[:number],
    type: session[:type],
    month: session[:month],
    year: session[:year],
    security: session[:security]
    )
     
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:nick_name, :email, :password, :password_confirmation, :family_name, 
      :first_name, :family_kana, :first_kana, :birthday_year, :birthday_month, :birthday_date, :phone_number, address_attributes:[:post, :prefecture, :city, :address, :buil ],credit_attributes:[:number,:type,:month,:year,:security]
  )
  end

end

