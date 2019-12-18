class SignupController < ApplicationController

  def step1
    #新規インスタンス作成
    @user = User.new
  end

  def step2
    #step1で入力された値をsessionで保存
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
    binding.pry
    #新規インスタンス作成
    @user = User.new
  end

  def step3
    #step2で入力された値をsessionで保存
    session[:phone_number] = user_params[:phone_number]
    #新規インスタンス作成
    @user = User.new
    #addressモデルと関連づける(fields_forを記述したビューを呼び出すアクションに記述する)
    @user.build_address
  end

  # def step4
    #step3で入力された値をsessionで保存
    # session[:id] = user_params[:address_attributes[:id]]
    # session[:post] = user_params[:address_attributes[:post]]
    # session[:prefecture] = user_params[:address_attributes[:prefecture]]
    # session[:city] = user_params[:address_attributes[:city]]
    # session[:address] = user_params[:address_attributes[:address]]
    # session[:buil] = user_params[:address_attributes[:buil]]
    #新規インスタンス作成
    # @user = User.new
    #creditモデルと関連づける(fields_forを記述したビューを呼び出すアクションに記述する)
    # @user.build_credit
  # end
  
  def done
    sign_in User.find(session[:user_id]) unless user_signed_in?
  end

  def create
    binding.pry
    @user = User.new(
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
    @user.build_address(user_params[:address_attributes])
    if @user.save
      session[:user_id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end
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
      #addressテーブルのカラム
      address_attributes: [:id,:post,:prefecture,:city,:address,:buil]
    )
  end
end
