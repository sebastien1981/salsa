Rails.application.routes.draw do
  get 'type_of_dances/new'
  get 'type_of_dances/create'
  get 'typeofdances/new'
  get 'teachers/new'
  get 'schools/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :schools do
    resources :school_classes
  end
  resources :teachers
end
