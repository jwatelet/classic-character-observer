Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'classes#index'

  get 'classes', action: :index, controller: 'classes'
  get 'rankings', action: :index, controller: 'rankings'
end
