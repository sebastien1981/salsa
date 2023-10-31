Rails.application.routes.draw do
  get 'dances/new'
  get 'teachers/new'
  get 'schools/new'
  devise_for :users
  root to: "schools#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :schools do
    resources :school_classes
  end
  resources :teachers
  resources :dances
end
