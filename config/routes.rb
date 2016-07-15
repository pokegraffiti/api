Rails.application.routes.draw do

  get '/success' => 'high_voltage/pages#show', id: 'success'
  get '/failure' => 'high_voltage/pages#show', id: 'failure'

  resources :orders, only: [:create] do
    get 'stats', on: :collection
  end
end
