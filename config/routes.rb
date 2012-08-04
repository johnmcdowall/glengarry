Glengarry::Engine.routes.draw do 
  root to: 'email_leads#index'
  resources :email_leads
end
