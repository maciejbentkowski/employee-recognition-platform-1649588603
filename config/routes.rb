# frozen_string_literal: true

Rails.application.routes.draw do
  get '/profiles/:id', to: 'profile#show', as: 'profile'
  resources :kudos
  devise_for :employees
  root to: "kudos#index"
end
