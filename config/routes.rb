Rails.application.routes.draw do

  devise_for :users

  resources :wikis

  resources :users, only: [:show]

  resources :charges, only: [:new, :create]

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
