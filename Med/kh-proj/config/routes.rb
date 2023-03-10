Rails.application.routes.draw do
  namespace :kh do
    namespace :api do
      resources :teams, only: []
      get '/teams/all/', to: 'teams#getAllTeams', as: 'index'
      get '/teams/show-one/:id', to: 'teams#getTeamById', as: 'show'
      post '/teams/create', to: 'teams#createTeam', as: 'create'
      put '/teams/update-one/:id', to: 'teams#updateTeam', as: 'update'
      delete '/teams/destroy-one/:id', to: 'teams#destroyTeam', as: 'destroy'
    end
  end

end


