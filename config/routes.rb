# frozen_string_literal: true

Rails.application.routes.draw do

  get '/profiles/:id', to: 'profiles#show', as: 'profile'
  get '/home', to: 'home#index', as: 'home'
  scope :admins do
  get '/pages', to: 'admins/pages#dashboard', as:'dashboard'
  get '/employees', to: 'admins/employees#index', as:'employees'
  end
  namespace :admins do
    resources :kudos, :employees, :company_values
    resources :rewards, only: [:index, :create, :new, :edit, :update, :destroy]
  end

  resources :rewards, only: [:index, :show]
  resources :kudos

  root to: "kudos#index"


  devise_for :employees

  devise_for :admins, :skip => [:registrations], :path_names => { :sign_in => ''}


end
