Rails.application.routes.draw do
  root 'events#index'

  devise_for :users
  resources  :users, only: :show do
    resources :profil_img, only: :create
  end
  resources  :events do
    resources  :attendances
    resources  :avatars, only: :create
  end

  namespace :admin do
    root 'admin#index'
    resources :users
    resources :admin, only: :index
    resources :events
    resources :attendances, only: :index
  end

end
