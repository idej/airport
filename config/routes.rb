Rails.application.routes.draw do
  resources :planes, except: [:show] do
    post :departing, on: :collection
  end

  root 'planes#index'
end

