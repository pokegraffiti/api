Rails.application.routes.draw do

  resources :orders, only: [:create] do
    get 'stats', on: :collection
  end
end
