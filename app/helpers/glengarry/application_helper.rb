module Glengarry
  module ApplicationHelper
    def pagination_count
      count = content_for(:email_count).to_i
      phrase = count < 10 ? "Showing #{count} of #{count}" : "Showing 10 of #{count}"
      return phrase if content_for?(:email_count)
      "No Leads Yet"
    end
  end
end
