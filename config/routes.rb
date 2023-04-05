Rails.application.routes.draw do
  root "staffings#index"
  resources :staffings, only: [:index, :new, :create]
  resources :members, only: [:index, :create, :destroy]
  resources :positions, only: [:index, :create, :destroy]
  resources :start_days, only: [:index, :create] do
    collection do
      delete 'destroy_all'
    end
  end
end
