Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'pages#home'
  get '/pages/yesterday', to: 'pages#yesterday'
  get '/pages/today', to: 'pages#today'
  get '/pages/tomorrow', to: 'pages#tomorrow'
  get '/pages/j-7',  to: 'pages#j-7'
  get '/pages/j-15', to: 'pages#j-15'
  get '/pages/j-30', to: 'pages#j-30'
  get '/pages/j-60', to: 'pages#j-60'
  get '/pages/j-90', to: 'pages#j-90'

  # resources :restaurants, only: [:index, :show, :new, :create] do
  #   resources :bookings, only: [:new, :create]
  # end

  resources :hotels, only:        [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :guests, only: [:new, :create, :edit, :update]
  end

  resources :guests, only: [:new, :create, :show, :edit, :update] do
    resources :tasks, only: [:index, :show, :new, :create, :edit, :update]
  end

  resources :restaurants, only:   [:index, :show]
  resources :destinations, only:  [:index, :show]
  resources :bookings, only:      [:index, :show]
  resources :reservations, only:  [:index, :show, :new, :create]
  resources :guests, only:        [:index, :show, :new, :create]

  resources :tasks, only:         [:index, :show, :new, :create] do
    resources :comments, only:    [:new, :create]
  end

  resources :tasks, only:         [:index, :show, :new, :create] do
    resources :status, only:    [:new, :create]
  end

  resources :restaurants, only:   [:index, :show, :new, :create] do
    resources :bookings, only:    [:index, :show, :new, :create]
  end
end
