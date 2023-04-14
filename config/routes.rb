Rails.application.routes.draw do
  devise_for :users
  resources :events
  root "events#index"

  post "subscriptions", to: "subscriptions#create"
  delete "subscriptions", to: "subscriptions#destroy"
  
end
