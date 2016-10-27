Rails.application.routes.draw do
  root      'static_pages#home'
  get       '/help',    to: 'static_pages#help',    as: 'help'
  get       '/about',   to: 'static_pages#about',   as: 'about'
  get       '/contact', to: 'static_pages#contact', as: 'contact'
  get       '/signup',  to: 'users#new'
  post      '/signup',  to: 'users#create'
  get       '/login',   to: 'sessions#new'
  post      '/login',   to: 'sessions#create'
  delete    '/logout',  to: 'sessions#destroy'
  get 'account_activations/:activation_token/edit', to: 'account_activations#edit',
  as:  'edit_account_activation'
  resources :users
  resources :groups
  #resources :account_activations, only: [:edit]
end
