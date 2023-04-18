Rails.application.routes.draw do
  namespace :api do
    resources :webhooks, only: [:create]
    post '/webhooks/flex_hire' => 'webhooks#show'
  end

  root 'homepage#index'
  get '/*path' => 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end