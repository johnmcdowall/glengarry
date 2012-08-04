Rails.application.routes.draw do root to: 'home#index'


  mount Glengarry::Engine => "/glengarry"
end
