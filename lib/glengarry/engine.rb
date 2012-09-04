require 'rubygems'
require 'kaminari'
require 'geocoder'
require 'jquery-rails'

require_relative '../email_validator'

module Glengarry
  class Engine < ::Rails::Engine
    isolate_namespace Glengarry
  end
end
