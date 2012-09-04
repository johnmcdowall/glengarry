Glengarry::Engine.routes.draw do 
  match 'email_leads/download' => 'EmailLeads#download', :as=>:download_csv
  resources :email_leads
end
