Rails.application.routes.draw do
  root to: 'brand/searches#index'

  namespace :brand do
    resources :searches, only: [:index]
  end

  namespace :staff do
    resources :searches, only: [:index]
    resources :gu_staffs, only: [:index, :create]
  end
end
