Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :items do 
        resources :recipes do
          resources :ingredients
          resources :instructions
        end
        resources :item_images
    end
    get '/users/:user_id/recipes/:recipe_id/ingredient_statuses', to: "recipe_statuses#get_ingredient_statuses_by_ids" 
      get '/users/:user_id/recipes/:recipe_id/instruction_statuses', to: "recipe_statuses#get_instruction_statuses_by_ids" 
  
    post '/users/:user_id/recipes/:recipe_id', to: "recipe_statuses#save_status_by_ids"
get '/users/:user_id/recipes', to: "recipes#get_recipes_by_user_id"
end