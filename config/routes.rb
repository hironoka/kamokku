Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
  end
  resources :users, only: [:index, :show, :edit, :update]
end
