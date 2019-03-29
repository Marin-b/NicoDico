Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get 'new', to: 'contrib#choose'
  resources :kor_words, :path => "coréen"
  post 'search' => 'kor_words#search'
  get 'carnet' => 'carnet#index'
  resources :listes, only: [:index, :show, :create, :update, :destroy, :edit]
  post 'new_kor_word' => 'contrib#new_kor_word'
end
