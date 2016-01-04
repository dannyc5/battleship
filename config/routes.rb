Rails.application.routes.draw do
  root 'pages#landing'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :games, only: [:index, :show, :create, :destroy]
      resources :moves, only: [:create, :index]
      resources :human_boards, only: [:create, :show]
      resources :cells, only: [:show, :index]
      resources :ships, only: [:create, :show, :index]
      resources :bot_boards, only: [:show]
    end
  end
end
