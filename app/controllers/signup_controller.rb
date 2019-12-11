class SignupController < ApplicationController

  def step1
    @user = User.new
  end

  def step2
    session[:email] = params[:email]
    @user = User.new
  end

  def step3
  end

  def step4
  end

  def done
  end
  
  def create
  end
  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :family_name, 
      :first_name, :family_kana, :first_kana
  )
  end

end
