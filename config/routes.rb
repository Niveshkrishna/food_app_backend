Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :items do 
        resources :recipes do
          resources :ingredients
          resources :instructions
        end
    end
end
