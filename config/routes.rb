Rails.application.routes.draw do
  extend Authenticator

  # authentification
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  resources :sessions, only: [:show, :destroy]
  resource :password, only: [:edit, :update]

  namespace :identity do
    resource :email, only: [:edit, :update]
    resource :email_verification, only: [:show, :create]
    resource :password_reset, only: [:new, :edit, :create, :update]
  end

  namespace :user do
    resource :dashboard, only: [:show]
    resources :sessions, only: [:index]
    end

  authenticate :admin do
    mount SolidErrors::Engine, at: "/solid_errors"
  end

  get "up" => "rails/health#show", :as => :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", :as => :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", :as => :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"
end
