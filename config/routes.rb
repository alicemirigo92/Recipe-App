Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"

  resources :recipes, except: [:update, :edit] do
    resources :recipe_foods, except: [:index]
  end
  
  resources :foods
  resources :users
  resources :shopping_list, only: [:index]
  resources :public_recipes, only: [:index]
end

