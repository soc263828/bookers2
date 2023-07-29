Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  resources :books
  patch '/books/:id', to: 'books#update', as: 'update_book'
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end