Rails.application.routes.draw do
  get 'api/state'
  get 'api/card_info'
  get 'sessions/status'

  root 'sessions#status'
end
