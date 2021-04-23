Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end

  root to: 'homes#top'
  get '/home/about' => 'homes#about'

  resources :users, only: %i[index show edit update]

  resources :articles, only: %i[index show create edit update destroy] do
    resources :article_comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
  end

  resources :genres, only: %i[index create edit update destroy]
end
