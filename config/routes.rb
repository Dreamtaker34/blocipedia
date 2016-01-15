Rails.application.routes.draw do

  devise_for :users

  resources :wikis do
    resources :collaborators
  end

  resources :users, only: [:show]

  resources :charges, only: [:new, :create]

  get 'downgrade' => 'users#downgrade'

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
