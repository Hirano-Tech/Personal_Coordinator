Rails.application.routes.draw do
  root to: 'gu_staffs#index'

  resources :gu_staffs, only: [:index, :create]
end
