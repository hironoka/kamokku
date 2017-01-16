class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def alert_user_edit_error_message
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :profile])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :avatar, :profile])
end
end
