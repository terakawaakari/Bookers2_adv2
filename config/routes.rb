Rails.application.routes.draw do

  root to: 'homes#top'

  devise_scope :user do
    post 'users/guest_sign_in' => 'application#guest_sign_in'
  end

  get 'home/about' => 'homes#about'

  get 'search' => 'searches#search'

  get 'books/tag_index' => 'books#tag_index'

  devise_for :users

  resources :users, :only => [:index, :show, :edit, :update]
  
  get 'add_user_to_group' => 'users#add_user_to_group'

  resources :books do
    resources :book_comments, :only => [:create, :destroy]
    resource :favorites, :only => [:create, :destroy]
  end


  resources :relationships, :only => [:create, :destroy]


  resources :users do
    get 'date_search' => 'users#date_search'
    member do
     get :show_following, :show_followers
    end
  end

  resources :groups, only: [:index, :new, :create, :show, :edit, :update] do
    resource :events, :only => [:new, :create]
    get 'preview' => 'events#preview'
    member do
      get :join, :leave, :invited_join, :reject
    end
  end

  get 'message/:id' => 'messages#show', as: 'message'
  resources :messages, only: [:create]

end
