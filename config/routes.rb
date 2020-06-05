
Rails.application.routes.draw do
  root "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users, only: [:show, :edit, :update, :index,]
resources :books


get 'home/about' => 'homes#about'

resources :books do
  	resource :favorites, only: [:create, :destroy]
  end

end

