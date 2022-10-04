Rails.application.routes.draw do
  root "categories#index"
  resources :categories, only: [:index, :show, :new, :create, :edit, :update] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end
end
