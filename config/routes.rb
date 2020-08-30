Rails.application.routes.draw do

  resources :trackers
  resources :tournaments, only: [:index, :show, :new, :create]
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions', :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#welcome'

  resources :users do
    resources :tournaments
    post '/users/:user_id/tournaments', to: 'tournaments#update', as: "update_won"
    delete 'tournaments/:id', to: 'tournaments#destroy', as: "remove_tourney" 
  end

  post '/users/:user_id/tournaments/new', to: 'tournaments#create'
  
end
