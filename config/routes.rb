Rails.application.routes.draw do
  get 'users/show'

  devise_for :users do
    resources :users, only: [:show]
  end
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
