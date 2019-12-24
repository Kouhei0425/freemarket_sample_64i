Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
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
      patch 'profile_update'
      get 'address_edit'
      patch 'address_update'
      get 'payment'
      get 'email'
      get 'identification'
      get 'phone'
    end
  end

  resources :users, only: :show do
    member do
      get 'logout'
      get 'notification'
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
  resources :categories, only: [:index, :show]
  resources :goods,  except: [:index] do
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

