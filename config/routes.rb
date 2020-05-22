Rails.application.routes.draw do
  get 'users/show'
  # get 'books/show'
  # get 'books/index'
  # # get 'users/index'
  # # get 'users/show'
  # # get 'users/edit'
  # # get 'users/info'

  # # get 'home/index'
  # get 'home/about'
  devise_for :users

  resources :users, only:[:index, :show, :edit, :update]
  resources :books
  get "about" => "home#about"

  # / へのルーティング
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end