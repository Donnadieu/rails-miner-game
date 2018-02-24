Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'my_devise/omniauth_callbacks', registrations: 'my_devise/registrations' }

  get '/', to: 'users#index'

  resources :users do
    resources :wallets, only: [:show, :update]
    resources :mining_rigs do
      resources :miners
    end
  end
end
