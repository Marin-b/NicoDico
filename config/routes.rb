Rails.application.routes.draw do
  devise_for :users

  ###Mixed
  root to: 'pages#home'
  #get 'new', to: 'contrib#choose'
  get 'carnet' => 'carnet#index'

    ##listes
    resources :listes, only: [:index, :show, :create, :update, :destroy, :edit]
    post 'wordtolist' => 'listes#add_word_from_list'
    post 'wordandlist' => 'listes#add_word_and_list'

    ##contrib
    get 'contribuer' => 'contrib#choose'

  ###KOREAN
  resources :kor_words, :path => "coréen", param: :id
  get 'selectkor' => 'kor_words#select_word'
  post 'search' => 'kor_words#search'
  post 'new_kor_word' => 'contrib#new_kor_word'
  resources :kor_nuances, only: [:new, :create, :destroy, :edit, :update]
end
