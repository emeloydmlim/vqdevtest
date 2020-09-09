Rails.application.routes.draw do
  
  resources :attachments
  devise_for :users
  get 'home/index'
  root :to => 'home#index'
  resources :project, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :task
  get 'taskdone/:id', to: 'task#setdone', as: 'task_done'
  get 'viewfiles/:id', to: 'attachments#viewfiles', as: 'task_viewfiles'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
