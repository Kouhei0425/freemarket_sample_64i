Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppage#index"
  resources :toppage do
    collection do
      get "search"
    end
  end
  
  resources :users 
  resources :brands
  resources :categories, only: [:show]
  resources :goods,  only: [:new, :create, :show]
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'done'
    end
end
