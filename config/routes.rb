Rails.application.routes.draw do
  root "staffings#index"
  resources :staffings, only: [:index, :edit]
end
