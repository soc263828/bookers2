Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"

  #patch '/books/:id', to: 'books#update', as: 'update_book'
  resources :books
  resources :users
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end