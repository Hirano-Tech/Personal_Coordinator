Rails.application.routes.draw do
  root to: 'staff/searches#index'

  namespace :staff do
    resources :searches, only: [:index]
    resources :gu_staffs, only: [:index, :create]
  end
end
