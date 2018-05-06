class ApplicationController < ActionController::Base

  before_action :configure_permited_parameters, if: :devise_controller?

   def check_login
  	unless user_signed_in?
  	  flash[:notice] = "Connectez vous ou inscrivez vous pour utiliser les gossips !"
  	  redirect_to root_path
  	end
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
