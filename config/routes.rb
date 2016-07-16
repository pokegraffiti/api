Rails.application.routes.draw do
  resources :orders, only: [:create] do
    get 'stats', on: :collection
    get 'failure', on: :collection
    get 'success', on: :member
  end
end
