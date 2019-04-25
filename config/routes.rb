Rails.application.routes.draw do
  require 'sidekiq/web'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
