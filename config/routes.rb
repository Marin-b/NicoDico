Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get 'new', to: 'contrib#choose'
  resources :kor_word, :path => "coréen"
  post 'search' => 'kor_word#search'
  get 'carnet' => 'carnet#index'
  resources :listes, only: [:index, :show, :create, :update, :destroy, :edit]
end
