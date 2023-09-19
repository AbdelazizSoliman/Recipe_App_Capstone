Rails.application.routes.draw do
  resources :foods, only: [:index, :new, :create, :show, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :ingredients, only: [:new,  :create, :edit, :update, :destroy]
    
    member do
      patch 'toggle_public'
      get 'new_food'
    end
  end
  
  devise_for :users
  get '/public_recipes', to: 'recipes#public_list'
  root to: "users#index"
end
