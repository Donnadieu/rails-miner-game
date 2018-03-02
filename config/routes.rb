Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'my_devise/omniauth_callbacks', registrations: 'my_devise/registrations' }

  get '/', to: 'application#index'
  patch '/mining_rig/:id/miners', to: 'miners#update'
  get '/users/highest_balance', to: 'users#highest_balance', as: 'highest_balance'

  resources :energy_packs
  resources :coins


  resources :users do
    resources :wallets, only: [:show, :update]
    resources :mining_rigs
  end
end
