Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'my_devise/omniauth_callbacks', registrations: 'my_devise/registrations' }

  get '/', to: 'application#index'
  get '/home', to: 'users#home'

  resources :users, only: [:index, :show] do
    resources :wallets, only: [:show, :new, :create, :update]
  end
end
