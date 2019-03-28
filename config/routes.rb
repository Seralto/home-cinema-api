Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index], defaults: { by_type: 'Movie' }, controller: :contents
      resources :seasons, only: [:index], defaults: { by_type: 'Season' }, controller: :contents
      resources :contents, only: [:index]
    end
  end

end
