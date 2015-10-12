Rails.application.routes.draw do
  get 'welcome/index'

  get '/about', to: 'welcome#about'
  
  get '/faq', to: 'welcome#faq'
  
  root to: 'welcome#index'
end
