class ApplicationController < ActionController::Base
  
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :set_locale

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:firstname, :lastname, :email, :number,:function, :country_id, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:firstname, :lastname, :email, :number,:function, :country_id, :password, :password_confirmation, :current_password)}
  end


  private

  def set_locale
    I18n.locale = "fr"
  end 

end
