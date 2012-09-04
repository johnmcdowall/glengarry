module Glengarry
  module ApplicationHelper
    def pagination_count
      "Showing x of #{content_for(:email_count)}" if content_for?(:email_count)
      "No Leads Yet"
    end
  end
end
