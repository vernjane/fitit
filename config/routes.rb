Rails.application.routes.draw do
  get '/', to: 'welcome_page#welcome'
  post '/', to: 'welcome_page#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
