Rails.application.routes.draw do
  get 'users/new'

  root 'static_pages#home'
  get  '/ajuda',    to: 'static_pages#help', as: 'help'
  get  '/sobre',   to: 'static_pages#about', as: 'about'
  get  '/contato',   to: 'static_pages#contact', as: 'contact'
end
