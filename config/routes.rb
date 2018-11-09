Rails.application.routes.draw do
  get 'landing/index'
  resources :memories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'landing#index'
end
