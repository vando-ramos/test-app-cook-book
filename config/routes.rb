Rails.application.routes.draw do
  root "home#index"

  resources :recipes
  resources :recipe_types
end
