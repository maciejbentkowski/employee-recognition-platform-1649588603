# frozen_string_literal: true

Rails.application.routes.draw do
  get '/profiles/:id', to: 'profile#show', as: 'profile'
  get '/home', to: 'home#index', as: 'home'
  resources :kudos
  devise_for :employees
  root to: "kudos#index"

end
