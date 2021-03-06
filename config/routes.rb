Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'forecast#show'
      get 'background', to: 'background#show'
      post 'users', to: 'users#create'
      post 'sessions', to: 'sessions#new'
      post 'road_trip', to: 'roadtrip#create'
      get 'foodie', to: 'foodie#show'
    end
  end
end
