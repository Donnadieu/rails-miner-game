Rails.application.routes.draw do
  devise_for :users
  resources :users

  get '/', to: 'application#index'
  get '/home', to: 'users#home'
end
