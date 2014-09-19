Rails.application.routes.draw do
  root to: 'links#index'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions
  resources :users
  resources :links, except: :show do
    resources :comments
  end
end
