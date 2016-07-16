# frozen_string_literal: true
Rails.application.routes.draw do
  get '/400', to: 'errors#bad_request', via: :all
  get '/404', to: 'errors#not_found', via: :all
  get '/500', to: 'errors#internal_server_error', via: :all

  resources :orders, only: [:create] do
    get 'stats', on: :collection
    get 'failure', on: :collection
    get 'success', on: :member
  end
end
