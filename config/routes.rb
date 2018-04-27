Rails.application.routes.draw do
  devise_for :users
  root to: "welcome_page#welcome"
  get '/robots.txt' => 'welcome_page#robots'
end
