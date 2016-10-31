Rails.application.routes.draw do
  resources :sessions

  resources :users
  delete 'sessions/delete', to: "sessions#destroy"
  root :to =>"sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
