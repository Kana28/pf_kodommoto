Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

  root to: 'homes#top'
  get "/home/about" =>"homes#about"


  resources :users, only: [:index, :show, :edit, :update]

  resources :articles, only: [:index, :show, :create, :edit, :update]

end
