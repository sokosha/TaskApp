Rails.application.routes.draw do

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get 'tasks/index' => "tasks#index"
  get 'tasks/:id', to: 'tasks#show'
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  post 'tasks/:id/update', to: 'tasks#update', as: :update_task
  post 'tasks/:id/destroy', to: 'tasks#destroy', as: :destroy_task
  
  resources :users do
  resources :tasks
  end
end
