# frozen_string_literal: true

Rails.application.routes.draw do

  get '/profiles/:id', to: 'profile#show', as: 'profile'
  get '/home', to: 'home#index', as: 'home'
  scope :admins do
  get '/pages', to: 'admins/pages#dashboard', as:'dashboard'
  end
  namespace :admins do
    resources :kudos
  end


  resources :kudos

  root to: "kudos#index"


  devise_for :employees

  devise_for :admins, :skip => [:registrations], :path_names => { :sign_in => ''}


end
