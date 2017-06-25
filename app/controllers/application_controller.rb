class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
   
   def imageUrl(object)
    "http://food-app-thenightsaredarkandfullofterrors.c9.users.io/#{object.image.url}"
   end
end
