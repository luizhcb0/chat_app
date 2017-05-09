Rails.application.routes.draw do
  root to: 'rooms#index'
  
  resources :rooms, only: [:index]
  resource :session, only: [:new, :create, :destroy]
  
  get "translate/:text/" => "rooms#translate", :as => "translate"
  get "online_users/" => "sessions#online_users", :as => "online_users"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
