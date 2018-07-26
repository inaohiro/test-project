Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'cushions#top'
  #get  'settings' =>  'settings#settings'
  #post 'settings' =>  'settings#create'
  #get  'tutorial' =>  'settings#tutorial'
  #get  'app' => 'app#top'
  get  'reset' => 'reset#hoge'

  namespace :api, { format: 'json' } do
    resource :token, only: [:create]
    post 'update'   => 'items#updatepants'
    get  'items'    => 'items#index'
    post 'items'    => 'items#create'
    get  'weathers' => 'weathers#index'
    post 'notification' => 'notification#push'
  end

  #get 'Weather' => 'weather#controller'

  # redirect all unknown routes to root_url
  get  '*path' => redirect('/')
end
