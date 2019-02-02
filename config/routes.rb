Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'events#index'
  resources :users, only: [:edit, :update, :show]
  resources :events do
    resources :attend_statuses, only: [:create]
    get 'attend_statuses/:token' => 'attend_statuses#edit'
    collection do
      get 'search'
    end
  end
  resources :groups, except: [:destroy] do
    get '/group_members/:token' => 'group_members#new'
    post '/group_members/:token' => 'group_members#create'
  end

end
