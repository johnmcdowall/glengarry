require 'test_helper'

module Glengarry
  class EmailLeadsControllerTest < ActionController::TestCase
    setup do
      @email_lead = email_leads(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:email_leads)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create email_lead" do
      assert_difference('EmailLead.count') do
        post :create, email_lead: { city: @email_lead.city, country: @email_lead.country, email: @email_lead.email, ip_address: @email_lead.ip_address, lat: @email_lead.lat, long: @email_lead.long, referer: @email_lead.referer }
      end
  
      assert_redirected_to email_lead_path(assigns(:email_lead))
    end
  
    test "should show email_lead" do
      get :show, id: @email_lead
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @email_lead
      assert_response :success
    end
  
    test "should update email_lead" do
      put :update, id: @email_lead, email_lead: { city: @email_lead.city, country: @email_lead.country, email: @email_lead.email, ip_address: @email_lead.ip_address, lat: @email_lead.lat, long: @email_lead.long, referer: @email_lead.referer }
      assert_redirected_to email_lead_path(assigns(:email_lead))
    end
  
    test "should destroy email_lead" do
      assert_difference('EmailLead.count', -1) do
        delete :destroy, id: @email_lead
      end
  
      assert_redirected_to email_leads_path
    end
  end
end
