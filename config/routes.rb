Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users

  get '/', to: 'application#index'
  get '/home', to: 'users#home'
end
