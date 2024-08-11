Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  # devise_for :users
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end

  get 'angular-items', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'  

  resources :blogs do
    member do
      get :toggle_status
    end
  resources :comments
  end

  # resources :technologies
  # resources :skills

  root to: 'static_pages#index'
  
  get   'about', to: 'static_pages#about'
  get   'contact', to: 'static_pages#contact'
  get   'privacy', to: 'static_pages#privacy'
  get 'tech-news', to: 'static_pages#tech_news'  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
