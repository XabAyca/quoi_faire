class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :admin)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :email, :password, :password_confirmation, :current_password, :admin)}
  end

  private

  def check_is_admin
    if current_user.admin == false || current_user.admin == nil
      flash[:danger] = "Vous n'êtes pas autoriser à acceder à cette page"
      redirect_to root_path
    end
  end

end
