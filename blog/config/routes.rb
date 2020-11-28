Rails.application.routes.draw do
  resources :articles
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles, only: %i[index show new create edit update destroy]
end
