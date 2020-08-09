Rails.application.routes.draw do
  root to: 'lyrics#index'
  
  resources :lyrics
end
