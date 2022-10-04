Rails.application.routes.draw do
  root "categories#index"
  resources :categories, only: [:index, :show, :new, :create, :edit, :update]
  resources :posts, only: [:index, :show, :new, :create, :destroy]
end
