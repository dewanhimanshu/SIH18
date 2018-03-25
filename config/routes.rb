Rails.application.routes.draw do
  get 'faq/index'

  resources :questions do
    resources :answers
  end

  get 'users/show'
  get 'admin/index' => "admin#index"
  get 'admin/show' => "admin#show"

  resources :applies

  resources :deadline, only: [:create,:edit,:update,:new,:destroy]

  root 'applies#index'

  get 'applies/status', to: 'applies#status'

  devise_for :users
  devise_scope :user do
  authenticated :user do
    root :to => 'applies#index', as: :authenticated_root
  end
  unauthenticated :user do
    root :to => 'devise/registrations#new', as: :unauthenticated_root
  end
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
