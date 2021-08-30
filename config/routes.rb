Rails.application.routes.draw do
  get 'users/show'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  
  
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]


 resources :users
end
