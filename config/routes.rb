Rails.application.routes.draw do
  root 'pages#landing'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :games, only: [:index, :show, :create, :destroy]
      resources :moves, only: [:create]
      resources :boards, only: [:create]
      resources :humans, only: [:create, :show]
    end
  end
end
