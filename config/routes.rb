Rails.application.routes.draw do
  root      'static_pages#home'

  get       '/help',              to: 'static_pages#help',    as: 'help'
  get       '/about',             to: 'static_pages#about',   as: 'about'
  get       '/contact',           to: 'static_pages#contact', as: 'contact'
  get       '/signup',            to: 'users#new'
  post      '/signup',            to: 'users#create'
  get       '/login',             to: 'sessions#new'
  post      '/login',             to: 'sessions#create'
  delete    '/logout',            to: 'sessions#destroy'
  get      '/groups/:group_id/members/:id', to: 'members#update'
  get       'account_activations/:activation_token/edit',
            to: 'account_activations#edit', as:  'edit_account_activation'
  patch    '/groups/:group_id',  to: 'members#update'

  resources :users
  resources :groups do
    resources :members, only: [:create, :update, :destroy]
    resources :tasks
  end
  resources :account_activations, only: [:edit]
end
