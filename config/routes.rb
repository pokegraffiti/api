Rails.application.routes.draw do
  get 'utility/stats'

  resources :orders, only: [:create]
end
