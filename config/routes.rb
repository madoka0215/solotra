Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:new, :create] do
    member do
      get :thinks
    end
  end
  
  resources :tours, except: [:create] do
    collection do
      get :search
      get :osaka
      get :nagoya
      get :fukuoka
    end
    resources :bookings, only: [:new]
  end
  
  post '/tours/new', to: 'tours#create'
  post '/tours/:tour_id/bookings/new', to: 'bookings#create'
  
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  
  resources :considerations, only: [:create, :destroy]
end
