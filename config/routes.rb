Rails.application.routes.draw do
 
  devise_for :admins

  resources :articles do 
    member do 
      get 'crop'
    end
    resource :comments do 
    end
  end
  resources :users
  resources :comments do

  end

  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/articlecrop/:id', to: 'articles#articlecrop'
  post '/articlecroppost/:id', to: 'articles#articlecroppost'

  root 'welcome#index'


end
