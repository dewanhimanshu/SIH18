Rails.application.routes.draw do
  get 'users/show'

  devise_for :users

  resources :applies

  root 'applies#index'

  get 'applies/status', to: 'applies#status'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
