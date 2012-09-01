Rails.application.routes.draw do 
  mount Glengarry::Engine => "/glengarry"
  root :to=>'home#index'
end
