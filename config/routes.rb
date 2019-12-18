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
  resources :categories, only: [:show]
  resources :goods,  only: [:new, :create, :show] do
  resources :buys,  only: [:index, :create]
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

