class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :set_cache_buster

    


 protected

 def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname,
    :email ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname,
    :email ])
  end

private

def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
end

