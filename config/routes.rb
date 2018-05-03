Rails.application.routes.draw do
  get 'malls/index'

  get 'malls/show'

  devise_for :users
  root to: "welcome_page#welcome"
  get '/robots.txt', to: 'welcome_page#robots'

  get '/googlef9762a8518fd8479.html', to: static('googlef9762a8518fd8479.html')
  resources :articles
end
