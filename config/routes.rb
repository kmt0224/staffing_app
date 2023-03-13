Rails.application.routes.draw do
  root "staffings#index"
  resources :staffings, only: [:index, :edit]
  resources :members, only: [:index, :create, :destroy]
  resources :positions, only: [:index, :create, :destroy]
end
