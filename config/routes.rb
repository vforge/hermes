Mercury::Application.routes.draw do

  namespace :admin do
    resources :users
    resources :target_params
  end
  resources :ads
  resources :ad_campaigns
  resources :ad_sizes, only: [:index, :show]


  get  'join',  to: 'session#new',      as: 'join'
  post 'join',  to: 'session#create'
  get  'leave', to: 'session#destroy',  as: 'logout'

  get  'home',  to: 'dashboard#home',   as: 'dashboard'

  root to: 'redirect#root'
end
