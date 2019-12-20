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
  resources :users do
    collection do
      get 'logout'
    end
  end
  resources :brands
  resources :categories, only: [:show]
  resources :goods,  only: [:new, :create, :show, :edit, :update] do
    resources :buys,  only: [:index, :create]
    member do
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

