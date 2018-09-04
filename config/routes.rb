Rails.application.routes.draw do
  get 'pages/secret'

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  resources :users, only: [:new, :create, :show]

  namespace :admin do
	 resources :homepage, only: [:index]
	end

  resources :plants


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
