Rails.application.routes.draw do
  get 'home/index'
  get 'home/reservation', as: :new_event

  root to: 'home#index'

  resources :events

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
