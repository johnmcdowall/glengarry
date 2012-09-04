FactoryGirl.define do
  factory :email_lead, :class=>Glengarry::EmailLead do
    email "test@example.com"
    ip_address "108.162.138.125"
    referer "google.ca"
  end
end
