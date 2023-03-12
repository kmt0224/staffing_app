Rails.application.routes.draw do
  root "staffings#index"
  resources :staffings, only: [:index, :edit]
  resources :members, only: [:index, :create]
end
