Rails.application.routes.draw do
  devise_for :users, only: [:session, :registration]
  root "lessons#index"
  get "/about" => "static_pages#about"
  namespace :admin do
    root "users#index"
    resources :users
    resources :subjects
    resources :questions
  end
  resources :users, only: [:index, :update]
  resources :questions
  resources :subjects, only: [:index]
  resources :lessons, accept: [:edit, :new, :destroy]
end
