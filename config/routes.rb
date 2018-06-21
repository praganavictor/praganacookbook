Rails.application.routes.draw do
  root to: "home#index"

  resources :recipes, :cuisines, :recipe_types
end
