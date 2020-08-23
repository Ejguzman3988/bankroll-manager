Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :poker_sites
  root 'application#welcome'
  resources :users do
    resources :games
    resources :cash_games
    resources :tournaments
  end
  post '/users/:user_id/games/new', to: 'games#create'
  resources :tournaments
  resources :cash_games

end
