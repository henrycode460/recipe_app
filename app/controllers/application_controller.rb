class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery with: :exception
    before_action :update_allowed_parameters, if: :devise_controller?
  
    # rescue_from CanCan::AccessDenied do |exception|
    #   redirect_to root_url, alert: exception.message
    # end
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :role) }
      # devise_parameter_sanitizer.permit(:account_update) do |u|
      #   u.permit(:name, :bio, :photo, :email, :password, :current_password)
      # end
    end
end
