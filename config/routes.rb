Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events do
    resources :attend_statuses, only: [:create]
    get 'attend_statuses/:token' => 'attend_statuses#edit'
  end
  resources :groups, except: [:destroy] do
    get '/:token' => 'group_members#new'
    post '/:token' => 'group_members#create'
  end
  resources :users, only: [:show]
end
