Rails.application.routes.draw do
    mount_devise_token_auth_for 'User', at: 'auth'
    get '/items/special_items', to: 'items#special_items_of_the_day'
   # devise_for :users, :controllers => { :omniauth_callbacks => "auth/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :items do 
        resources :recipes do
          resources :ingredients
          resources :instructions
          resources :nutrition, only: [:create, :destroy, :index, :update]
        end
        resources :item_images
    end
    get '/all_items', to: 'items#all_items'
    post 'items/:item_id/recipes/:recipe_id/ingredients/:id', to: 'ingredients#update'
    get '/users/:user_id/recipes/:recipe_id/ingredient_statuses', to: "recipe_statuses#get_ingredient_statuses_by_ids" 
    get '/users/:user_id/recipes/:recipe_id/instruction_statuses', to: "recipe_statuses#get_instruction_statuses_by_ids" 
    get '/users/:user_id/recipes/:recipe_id/shopping_bag_status', to: "recipe_statuses#get_shopping_bag_status_by_id"
  
    post '/users/:user_id/recipes/:recipe_id', to: "recipe_statuses#save_status_by_ids"
    get '/users/:user_id/recipes/:recipe_id', to: "recipe_statuses#get_status"
    post '/users/:user_id/recipes/:recipe_id/reviews', to: "recipes#post_reviews"
    get '/users/:user_id/recipes', to: "recipes#get_recipes_by_user_id"
    get '/items/:item_id/recipes/:recipe_id/reviews', to: "recipes#get_reviews"
  
    get '/users/:user_id/recipe_statuses', to: "recipe_statuses#get_recipe_statuses"
  #get '/users/:user_id/cart_items', to: "cart_items#index"
  post '/users/:user_id/cart_items/:id', to: "cart_items#create"
    get '/search/:term', to: 'items#search_item'
    get '/users/:user_id/pocket/', to: "pockets#get_pocket_recipes"
  post '/users/:user_id/pocket/', to: "pockets#create"
  post '/pockets/:pocket_id/recipes/:recipe_id', to: "pockets#add_to_pocket"
  delete '/pockets/:pocket_id/recipes/:recipe_id', to: "pockets#remove_from_pocket"
  delete '/pockets/:pocket_id/', to: "pockets#clear_pocket"
  resources :users do
    resources :cart_items, controller: 'cart_items', only: [:create, :index, :destroy, :show]
  end
  resources :users do
    resources :shopping_items, controller: 'shopping_items', only: [:create, :index, :destroy, :update]  end
end
  
  