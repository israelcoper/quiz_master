Rails.application.routes.draw do
  namespace :admin do
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :questions
  end
end
