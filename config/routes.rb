Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get 'home/about' , to:'homes#about'
  resources :books, only: [:update, :create, :index, :show, :destroy,:edit]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
