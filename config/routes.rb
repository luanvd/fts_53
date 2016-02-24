Rails.application.routes.draw do
  devise_for :users, only: [:session, :registration]
  root "static_pages#home"
  get "/about" => "static_pages#about"
  namespace :admin do
    root "users#index"
    resources :users
    resources :subjects
    resources :questions, only: [:index]
  end
  resources :users
end
