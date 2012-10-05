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
    before_save :generate_activation_token

    def self.activate
      self.active = true
      save!
    end

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

    def generate_activation_token
      self.activation_token = rand(36**12).to_s(36)
    end
  end

end
