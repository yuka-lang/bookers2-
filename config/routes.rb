Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'

  resource :favorites, only: [:create, :destroy]

  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  get 'home/about' => 'homes#about'

end