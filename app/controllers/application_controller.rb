class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :permit_params, if: :devise_controller?

  protected
  def permit_params

    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :last_name, :birthday, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:first_name, :last_name, :birthday, :email, :password, :current_password, :remember_me)}
  end
end
