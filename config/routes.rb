Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: 'users/registrations'
  }

  root 'home#index'

  resources :items

  resources :users do
    get :keyword, on: :member
    post :keyword, on: :member
    delete :keyword, on: :member
    get :items, on: :member
  end


end
