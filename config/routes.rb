Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :courses, only: [:index, :show]
      resources :players, only: [:index, :show, :create]
    end
  end
end
