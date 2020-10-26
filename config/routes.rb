Rails.application.routes.draw do
  get 'api/state'
  get 'sessions/status'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#status'
end
