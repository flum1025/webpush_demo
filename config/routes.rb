Rails.application.routes.draw do
  resources :device, only: [:create]

  get 'push/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
