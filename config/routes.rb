Rails.application.routes.draw do
  root 'pages#landing'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :games, only: [:index, :show, :create, :destroy]
      resources :moves, only: [:create]
      resources :boards, only: [:show]
      resources :humans, only: [:create, :show]
      resources :ships, only: [:create]
    end
  end
end
