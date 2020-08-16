Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]

  resources :tours do
    collection do
      get :search
      get :osaka
      get :nagoya
      get :fukuoka
    end
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
end
