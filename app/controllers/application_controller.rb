class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :permit_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if (current_user.admin==true)
      admin_index_path
    else
      applies_path
    end
  end


  protected
  def permit_params

    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :last_name, :birthday, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update){|u| u.permit(:first_name, :last_name, :birthday, :email, :password, :current_password, :remember_me)}
  end
end
