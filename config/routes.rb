Rails.application.routes.draw do
  get '/weather', to: 'weather#index'
  # get 'weather/index'
  get "up" => "rails/health#show", as: :rails_health_check
  root 'weather#index'
end
