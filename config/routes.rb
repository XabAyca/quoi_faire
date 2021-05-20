Rails.application.routes.draw do
  root 'events#index'

  devise_for :users
  resources  :users, only: :show 
  resources  :events do
    resources  :attendances
    resources  :avatars, only: :create
  end


end
