Rails.application.routes.draw do
  get '/home', to: 'static_pages#home'
  get '/info', to: 'static_pages#info'
  get '/about', to: 'static_pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
