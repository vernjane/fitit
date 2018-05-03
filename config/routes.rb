Rails.application.routes.draw do
  get 'malls/index'

  get 'malls/show'

  devise_for :users
  root to: "welcome_page#welcome"
  get '/robots.txt', to: 'welcome_page#robots'

  resources :articles
end
