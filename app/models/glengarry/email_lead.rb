require_relative '../../../lib/email_validator'

module Glengarry

  class EmailLead < ActiveRecord::Base
    extend Geocoder::Model::ActiveRecord

    attr_accessible :email

    validates :email, :presence => true, :uniqueness => true, :'Glengarry::Email'=>true

    geocoded_by :ip_address, :latitude => :lat, :longitude => :long
    reverse_geocoded_by :lat, :long do |obj, results|
      obj.set_reversed_location(results)
    end

    after_validation :full_geocode

    def set_reversed_location(results)
      if geo = results.first
        self.city = geo.city
        self.country = geo.country
      end
    end

    private

    def full_geocode
      geocode
      reverse_geocode
    end
  end

end
