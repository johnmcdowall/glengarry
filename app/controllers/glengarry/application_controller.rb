require 'glengarry/application_controller'

module Glengarry
  class ApplicationController < ActionController::Base
    cattr_accessor :authenticator

    # This is a useful pattern I found in the Tolk source: https://github.com/tolk/tolk/blob/master/app/controllers/tolk/application_controller.rb
    def authenticate
      self.authenticator.bind(self).call if self.authenticator && self.authenticator.respond_to?(:call)
    end
  end
end
