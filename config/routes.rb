Rails.application.routes.draw do

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  namespace :admin do
	 resources :homepage, only: [:index]
   resources :plants, only: [:new, :create, :destroy]
	end

  resources :plants, except: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
