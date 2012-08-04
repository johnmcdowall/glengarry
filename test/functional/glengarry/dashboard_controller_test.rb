require 'test_helper'

module Glengarry
  class DashboardControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
