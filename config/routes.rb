Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppage#index"
  resources :toppage do
    collection do
      get "search"
    end
  end
  
  resources :users
  resources :brands
  resources :categories
  resources :goods,      only: [:new, :create]
end
