Rails.application.routes.draw do
  root    'static_pages#home'
  get     '/help',              to: 'static_pages#help',    as: 'help'
  get     '/about',             to: 'static_pages#about',   as: 'about'
  get     '/contact',           to: 'static_pages#contact', as: 'contact'
  get     '/signup',            to: 'users#new'
  post    '/signup',            to: 'users#create'
  get     '/login',             to: 'sessions#new'
  post    '/login',             to: 'sessions#create'
  delete  '/logout',            to: 'sessions#destroy'
  get     'account_activations/:activation_token/edit',
                            to: 'account_activations#edit', as:  'edit_account_activation'
  patch   '/groups/:group_id',  to: 'members#update'
  get     '/groups/:group_id/tasks/:id', to: 'comments#index', as: 'task_comments'
  get     'comments/:id/vote_up',   to: 'comments#vote_up',    as: 'vote_up'
  get     'comments/:id/vote_down', to: 'comments#vote_down',  as: 'vote_down'
  post    'follow/:id',             to: 'users#follow',        as: 'follow'
  delete  'follow/:id',             to: 'users#unfollow',      as: 'unfollow'

  resources :users
  resources :account_activations, only: [:edit]
  resources :comments, only: [:new, :create]
  resources :groups do
    resources :members, only: [:create, :update, :destroy]
    resources :tasks
  end
end
