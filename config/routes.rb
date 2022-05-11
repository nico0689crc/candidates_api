Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :jobs_applicants_pipelines, only: [:update]
      resources :pipelines, only: [ :show, :create, :update, :destroy]
      resources :attendants, only: [:index, :show, :create, :update, :destroy]
      resources :jobs_applicants, only: [:show, :create, :destroy]
      resources :applicants, only: [:index, :show, :create, :update, :destroy]
      resources :jobs, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
