class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
      added_attrs = [ :username, :role, :contact, :slug]
  
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    def after_sign_up_path_for(resource)
      root_path
    end
    
end
