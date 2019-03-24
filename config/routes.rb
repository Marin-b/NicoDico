Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :word_kor, :path => "coréen"
end
