Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :show], defaults: { by_type: 'Movie' }, controller: :contents
      resources :seasons, only: [:index, :show], defaults: { by_type: 'Season' }, controller: :contents
      resources :contents, only: [:index, :show]

      resources :purchases, only: [:index, :show, :create]

      resources :users, only: [] do
        get :library, on: :member, controller: :purchases, action: :index
      end
    end
  end

end
