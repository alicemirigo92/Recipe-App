Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  
  resources :recipes do
    resources :recipe_foods
  end
  resources :foods
  resources :users
  resources :shopping_list
  resources :public_recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
