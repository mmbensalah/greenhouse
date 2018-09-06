Rails.application.routes.draw do

  root 'sessions#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:create, :delete]
  end

  namespace :admin do
	 resources :homepage, only: [:index]
   resources :plants, only: [:new, :create, :destroy, :edit, :update]
   resources :green_houses
	end

  resources :plants, except: [:new, :create, :destroy, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
