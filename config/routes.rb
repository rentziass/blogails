Rails.application.routes.draw do

  get "home/index"
  root "home#index"

  devise_for :users
  namespace :admin do
    root "admin#index"
    resources :categories
    resources :enclosures
    resources :links
    resources :articles
    resources :pages
    resources :user_lists
    resources :options
    resources :articles, only: :index do
      collection do
        post :import
        get :autocomplete
      end
      root to: "articles#index"
    end
  end

  post "/tinymce_assets" => "tinymce_assets#create"
  resources :pages
  resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  resources :categories
end
