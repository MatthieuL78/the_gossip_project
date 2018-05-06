Rails.application.routes.draw do
  get 'profile/:id', to: 'users#profile', as: :user_profile
  devise_for :users
  resources :gossips, :comments
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
