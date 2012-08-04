module Glengarry
  class EmailLead < ActiveRecord::Base
    attr_accessible :city, :country, :email, :ip_address, :lat, :long, :referer
  end
end
