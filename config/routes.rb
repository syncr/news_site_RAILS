Rails.application.routes.draw do
  root to: 'links#index'
  resources :sessions
  resources :users
  resources :links, except: :show do
    resources :comments
  end
end
