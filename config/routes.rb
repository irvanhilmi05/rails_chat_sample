Rails.application.routes.draw do
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end

  root "chatrooms#show", id: 1  # Change `1` to the ID of your default chatroom
end
