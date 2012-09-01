module Glengarry
  class EmailLead < ActiveRecord::Base
    attr_accessible :email

   # validates :email, :email => true, :uniqueness => true
    extend Geocoder::Model::ActiveRecord

    geocoded_by :ip_address, :latitude => :lat, :longitude => :long
    reverse_geocoded_by :lat, :long do |obj, results|
      obj.set_reversed_location(results)
    end

    after_validation :full_geocode

    def set_ip_and_referer(ip, referer)
      self.ip_address, self.referer = ip, referer
    end

    def set_reversed_location(results)
      if geo = results.first
        self.city = geo.city
        self.country = geo.country
      end
    end

    def full_geocode
      geocode
      reverse_geocode
    end
  end
end
