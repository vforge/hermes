Mercury::Application.routes.draw do
  namespace :admin do
  get 'users/index'
  end

  namespace :admin do
  get 'users/new'
  end

  namespace :admin do
  get 'users/edit'
  end

  namespace :admin do
    resources :users
  end

  get  'join',  to: 'session#new',      as: 'join'
  post 'join',  to: 'session#create'
  get  'leave', to: 'session#destroy',  as: 'logout'
  get  'home',  to: 'dashboard#home',   as: 'dashboard'

  root to: 'redirect#root'
end
