Rails.application.routes.draw do
  get '/auth', to: 'auth#index'
end
