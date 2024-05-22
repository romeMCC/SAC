Rails.application.routes.draw do
  namespace :admin do
      resources :administrative_units
      resources :catalogs
      resources :catalog_data
      resources :data_dictionaries
      resources :data_dictionary_fields
      resources :field_types
      resources :modification_types
      resources :organisms
      resources :users

      root to: "catalogs#index"
    end
  # Defines the root path route ("/")
  root to: "catalogs#index"
  #resources :data_dictionary_fields
  #resources :data_dictionaries
  get "/data_dictionary/data_dictionary_fields/new" => "data_dictionary/data_dictionary_fields#new", :as => :data_dictionary_data_dictionary_fields
  # resources :data_dictionaries do
  #   resources :data_dictionary_fields
  # end
  resources :data_dictionaries do
    member do
      resources "data_dictionary/data_dictionary_fields", only: [:create, :destroy], as: :data_dictionary_data_dictionary_fields
      resources "data_dictionary_fields", only: [:index], as: :data_dictionary_fields
    end
  end
  resources :catalog_data
  resources :catalogs do
    resources :data_dictionaries
  end
  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  resources :field_types, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # resources :data_dictionary_fields, only: [], param: :index do
  #   #resources :data_dictionaries
  #   member do
  #     delete '(:id)' => "data_dictionary_fields#destroy", as: ""
  #     post '/' => "data_dictionary_fields#create"
  #   end
  # end
end
