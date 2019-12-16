class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation, :family_name, 
      :first_name, :family_kana, :first_kana, :birthday_year, :birthday_month, :birthday_date])
  end

  private

  def production?
    Rails.env.production?
  end

  
end
