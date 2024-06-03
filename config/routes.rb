Rails.application.routes.draw do
  devise_for :users

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms

  # config/routes.rb
  mount ActionCable.server => '/cable'
end