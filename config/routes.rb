Rails.application.routes.draw do
  get '/home', to: 'static_pages#home'
  get '/info', to: 'static_pages#info'
  get '/about', to: 'static_pages#about'
  get '/distance', to: 'static_pages#distance'
  resources :airports
  get '/list', to: 'airports#list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
