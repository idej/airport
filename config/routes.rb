Rails.application.routes.draw do
  resources :planes
  root 'planes#index'
end

