# frozen_string_literal: true

Rails.application.routes.draw do
  get '/home', to: 'home#index', as: 'home'

  devise_for :employees
  authenticate :employee do
      root to: "kudos#index"
  get '/profiles/:id', to: 'employees#show', as: 'profile'
  resources :rewards, only: [:index, :show]
  resources :kudos
  end

  devise_for :admins, :skip => [:registrations], :path_names => { :sign_in => ''}
  authenticate :admin do
    scope :admins do
      get '/pages', to: 'admins/pages#dashboard', as:'dashboard'
      get '/employees', to: 'admins/employees#index', as:'employees'
    end
  end
  namespace :admins do
    authenticate :admin do
      resources :kudos, :employees, :company_values
      resources :rewards, only: [:index, :create, :new, :edit, :update, :destroy]
    end
  end

end
