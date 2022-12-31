Rails.application.routes.draw do
  resources :posts
  root 'posts#new'
  get '/index', to: 'welcome#index'
  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'
  get '/complete', to: 'welcome#complete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
