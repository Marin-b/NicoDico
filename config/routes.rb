Rails.application.routes.draw do
  devise_for :users
  post 'search' => 'word_kor#search'
  root to: 'pages#home'
  resources :word_kor, :path => "coréen"
end
