Mercury::Application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'get',       to: 'content#get'
      get 'click/:id', to: 'content#click'
    end
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
