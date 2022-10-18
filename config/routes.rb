Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "restaurants#index"

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: :destroy
end
