Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events do
    resources :attend_statuses, only: [:create]
  end
end
