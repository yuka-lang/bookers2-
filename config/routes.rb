Rails.application.routes.draw do
  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search' => 'searchs#search'


  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

   resources :groups, except: [:destroy]
end