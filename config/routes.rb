HgAu::Application.routes.draw do

  namespace :api, defaults: { format: :json } do
    get 'v1/get',       to: 'v1#get'
    get 'v1/click/:id', to: 'v1#click'
  end

  concern :activated do
    member do
      post 'activate'
      post 'inactivate'
    end
  end

  namespace :admin do
    resources :users
    resources :target_params
  end

  resources :ad_campaigns, concerns: [:activated] do
    resources :ads, concerns: [:activated]
  end

  resources :ad_sizes, only: [:index, :show]


  get  'join',  to: 'session#new',      as: 'join'
  post 'join',  to: 'session#create'
  get  'leave', to: 'session#destroy',  as: 'logout'

  get  'home',  to: 'dashboard#home',   as: 'dashboard'

  root to: 'redirect#root'
end
