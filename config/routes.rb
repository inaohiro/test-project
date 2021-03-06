Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'cushions#top'
  #get  'settings' =>  'settings#settings'
  #post 'settings' =>  'settings#create'
  #get  'tutorial' =>  'settings#tutorial'
  #get  'app' => 'app#top'
  get  'reset' => 'reset#hoge'
  get  'checkpants' => 'checkpants#getFewpantsToken'

  namespace :api, { format: 'json' } do
    resource :token, only: [:create]
    post 'update'   => 'items#updatepants'
    get  'items'    => 'items#index'
    post 'items'    => 'items#create'
    get  'weathers' => 'weathers#index'

    get  'notification' => 'notification#get'
    post 'notification' => 'notification#push'
  end

  #get 'Weather' => 'weather#controller'

  # redirect to root if user directly access to /settings
  get  'settings' => redirect('/')
end
