Rails.application.routes.draw do
  root 'games#index'

  resources :games, only: [:index, :create, :destroy]
end
