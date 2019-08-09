Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :games do
    resources :trackers
  end
  root to: 'static_pages#home'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'trackers', to: 'trackers#index', as: 'trackers'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/update_game', to: 'games#update', via: 'get'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
