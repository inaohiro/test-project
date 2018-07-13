Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # HTTP メソッド  URLパス  <コントローラ名>#<メソッド名>
  get 'weather' => 'weather#show'
end
