Rails.application.routes.draw do
  root 'pages#landing'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      # resources :games, only: [:index, :show, :create, :destroy] do
      #   resources :players, only: [:index]
      # end
      # resources :moves, only: [:create, :index]
      # resources :boards, only: [:show]
      # resources :humans, only: [:create, :show]
      # resources :bots, only: [:show]
      # resources :players, only: [:show]
      # resources :ships, only: [:create, :show, :index]
    end
  end
end
