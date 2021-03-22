Rails.application.routes.draw do
  get 'home/about', to: "homes#about"
  get 'home/top', to: "homes#top"
  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users
end
