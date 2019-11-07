Rails.application.routes.draw do
  resources :staffs
  resources :purchase_logs
  resources :stores
  resources :luggages
  resources :users
  resources :airplane_classes
  resources :flights
  resources :airplanes

  get '/qrcode/generate/:id', to: 'qrcode#generate'
  get '/qrcode/auth', to: 'qrcode#auth'
  get '/auth/store', to: 'auth#store'
  get '/auth/staff', to: 'auth#staff'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
