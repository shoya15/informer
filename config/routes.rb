Rails.application.routes.draw do
  resource :posts, only: %i[new create destroy]
  resource :contacts, only: %i[new create]
  root to: 'posts#destroy'
  get '/about', to: 'welcome#about'
  get '/complete', to: 'welcome#complete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
