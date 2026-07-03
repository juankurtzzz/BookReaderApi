Rails.application.routes.draw do
  resources :readings do
    collection do
      get :reading_now
      get :reading_finished
    end

    member do
      get :current_reading
      get :finished_reading
    end
  end

  resources :books do 
    collection do
      get :search
      get :categories
      get :authors
      get :long_books
      get :short_books
    end

    member do 
      get :category_by_id
      get :author_by_id
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
