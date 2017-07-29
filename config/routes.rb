Rails.application.routes.draw do

  devise_for :users
  root to: "tasks#index"

  get '/mind_dump', to: "tasks#mind_dump"
  get '/unassigned', to: "tasks#unassigned"

  resources :tasks do
    member do
      patch 'complete'
    end
  end

end
