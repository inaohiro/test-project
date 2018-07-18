Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    resource :token, only: [:create]

    post 'update' => 'item#create'
  end
end
