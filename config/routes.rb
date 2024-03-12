Rails.application.routes.draw do
  resources :participants do
    member do
      get :download
      get 'pdf/print_details', to: 'pdf#print_details', as: 'print_details'

    end
  end

  resources :course_categories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "participants#index"
end
