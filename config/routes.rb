Rails.application.routes.draw do
  root to: 'users#index'

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}, skip: [:sessions]

  get '/generosity', to: 'users#edit', as: :user_root

  resources :users, only: [:index, :update, :edit]
end
