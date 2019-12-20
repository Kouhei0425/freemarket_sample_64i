Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "toppage#index"
  resources :toppage do
    collection do
      get "search"
    end
  end

  resources :brands
  resources :users, except: :show do 
    member do
      get 'profile'
      get 'address'
      get 'payment'
      get 'email'
      get 'identification'
      get 'phone'
    end
  end

  resources :users, only: :show do
    member do
      get 'logout'
      get 'news'
      get 'guide'
      get 'contact'
      get 'todo'
      get 'likes'
      get 'items'
      get 'dealing'
      get 'sold'
      get 'buying'
      get 'bought'
      get 'rates'
    end
  end
  resources :brands
  resources :categories, only: [:show]
  resources :goods,  only: [:new, :create, :show, :edit, :destroy] do
    resources :buys,  only: [:index, :create]
    collection do
      get 'selledit'
    end
  end

  resources :credit, only: [:new, :show] do
    collection do
      post 'show', to: 'credits#show'
      post 'pay', to: 'credits#pay'
      post 'delete', to: 'credits#delete'
    end
  end
  
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'done'
    end
  end
end

