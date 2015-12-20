Rails.application.routes.draw do
  root 'pages#landing'

  resources :games, only: [:index, :show, :create, :destroy]
  resources :moves, only: [:create]
end
