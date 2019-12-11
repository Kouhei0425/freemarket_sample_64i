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
  end

  def step4
  end

  def done
  end
  
  def create
    @user = User.new(
    #1ページ目で入力したデータ
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password]
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name],
    first_name: session[:first_name],
    family_kana: session[:family_kana],
    first_kana: session[:first_kana],
    birsday_year: session[:birsday_year],
    birsday_month: session[:birsday_month],
    birthday_date: session[:birthday_date]
    )
  end
  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :family_name, 
      :first_name, :family_kana, :first_kana
  )
  end

end

