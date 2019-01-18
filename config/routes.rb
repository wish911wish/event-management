Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events do
    resources :attend_statuses, only: [:create]
    get '/:token' => 'attend_statuses#edit'
  end
  resources :groups, except: [:destroy] do
    resources :group_members, only: [:create]
  end
end
