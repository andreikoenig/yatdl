Rails.application.routes.draw do

  root to: "tasks#index"

  get '/mind_dump', to: "tasks#mind_dump"

  resources :tasks do
    member do
      patch 'complete'
    end
  end

end
