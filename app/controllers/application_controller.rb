class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me, :image, :image_cache, :remove_image) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :image, :image_cache, :remove_image) }
    devise_parameter_sanitizer.permit(:edit) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :image, :image_cache, :remove_image) }
  end
end
