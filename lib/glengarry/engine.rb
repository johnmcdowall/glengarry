require 'rubygems'
require 'kaminari'
require 'geocoder'
require 'jquery-rails'

module Glengarry
  class Engine < ::Rails::Engine
    isolate_namespace Glengarry
  end
end
