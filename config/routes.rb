Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  get "/about" => "static_pages#about"
  match "/users/:id/finish_signup", to: "users#finish_signup", via: [:get, :patch], as: :finish_signup
  devise_scope :user do
    authenticated :user do
      root to: "lessons#index", as: "authenticated_root"
    end

    unauthenticated do
      root to: "devise/sessions#new", as: "root"
    end
  end
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
