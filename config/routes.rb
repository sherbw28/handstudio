Rails.application.routes.draw do
  root to: 'toppages#index'
  
  resources :lyrics do
     resources :comments, only: [:create, :destroy]
  end

  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
end