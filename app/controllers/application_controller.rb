class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path(users)
    grid_index_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:authid, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |i| u.permit(:authid, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:authid, :email, :password, :password_confirmation, :current_password) }
  end
end
