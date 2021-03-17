Rails.application.routes.draw do
  get 'homes/about'
  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users
end
