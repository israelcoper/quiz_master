Rails.application.routes.draw do
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :quizzes

  namespace :admin do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :questions
  end

  root to: "quizzes#index"
end
