Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'signout' => 'devise/sessions#destroy'
  end

  root to: 'toppages#index'

  resources :users

  resources :tours

  # namespace :admin do
  #   resources :tour_posts
  # end
end
