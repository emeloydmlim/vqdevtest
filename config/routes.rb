Rails.application.routes.draw do
  
  devise_for :users
  get 'home/index'
  root :to => 'home#index'
  resources :project, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :task
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
