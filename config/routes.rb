Rails.application.routes.draw do
  get 'teachers/new'
  get 'teachers/create'
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
