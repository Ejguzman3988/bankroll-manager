Rails.application.routes.draw do
  get 'users/show'
  get 'users/update'
  resources :trackers
  resources :tournaments, only: [:index, :show, :new, :create]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#welcome'

  resources :users do
    resources :tournaments
  end
  post '/users/:user_id/tournaments/new', to: 'tournaments#create'

end
