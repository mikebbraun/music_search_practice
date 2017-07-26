Rails.application.routes.draw do
  resources :labels
  resources :albums
  root 'static#search'
  get 'static/search'
  post 'static/search'

  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
