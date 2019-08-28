Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  ###Mixed
  root to: 'pages#home'
  #get 'new', to: 'contrib#choose'
  get 'carnet' => 'carnet#index'

    ##listes
  resources :listes, only: [:index, :show, :create, :update, :destroy, :edit]
  post 'wordtolist' => 'listes#add_word_from_list'
  post 'wordandlist' => 'listes#add_word_and_list'
  get 'fetch_nuance' => 'listes#fetch_nuance'

  ##dicts
  resources :dict do
    post 'search' => 'dict#search'
    resources :word
  end
  get 'choose' => 'word#choose_dictionary_contrib'
  get 'natures' => 'natures#edit'
  get 'about' => 'pages#about'
  get 'cg' => 'pages#cg'
  resources :natures, only: [:create, :destroy]
  resources :suggestions
end
