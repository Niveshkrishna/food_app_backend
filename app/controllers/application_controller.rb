class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :add_sanitized_params, if: :devise_controller?
   
 def add_sanitized_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:role,:name,:email, :password, :password_confirmation]) 
 end
  
   def imageUrl(object)
    "http://food-app-thenightsaredarkandfullofterrors.c9users.io#{object.image.url}"
   end
    def index
        
    end
end

