Rails.application.routes.draw do

  devise_for :users
  resources  :users, only: :show 
  resources  :events do
    resources  :attendances
    resources  :avatars, only: :create
  end
  root 'events#index'

end
