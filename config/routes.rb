Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'cushions#top'
  get  'settings' =>  'settings#settings'
  post 'settings' =>  'settings#create'
  get  'tutorial' =>  'settings#tutorial'
  get  'app' => 'app#top'

  namespace :api, { format: 'json' } do
    resource :token, only: [:create]

    post 'update' => 'item#create'
  end

  get 'Weather' => 'weather#controller'
end
