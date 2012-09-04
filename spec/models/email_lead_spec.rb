require 'spec_helper'

describe Glengarry::EmailLead do

  before do
    @el = Glengarry::EmailLead.new
    @test_email = "test@example.com"
  end

  subject { @el }

  it "saves an email address" do
    @el.email = @test_email
    @el.save!

    expect { email_was_saved_correctly }
  end

  it "raises an exception when no email is specified" do
    expect { @el.save! }.to raise_error ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank, Email has invalid format"
  end

  it "raises an exception when the email address has already been recorded" do
    @el.email = @test_email
    @el.save!

    @nl = Glengarry::EmailLead.new
    @nl.email = @test_email
    expect { @nl.save! }.to raise_error ActiveRecord::RecordInvalid, "Validation failed: Email has already been taken"
  end

  describe "Geocoding" do
    before do
      @el.email = @test_email
      @el.ip_address = "108.162.138.101"
      @el.save!
    end

    it "stored the IP correctly" do 
      expect { ip_was_saved_correctly }
    end

    it "geo-locates a set IP number to a City" do
      @el.city.should == "Potwin"
    end

    it "calculates the latitude" do
      @el.lat.should == 38.0
    end

    it "calcuates the longitude" do
      @el.long.should == -97.0
    end
  end

  it "stores a referer when set" do
    @el.email = "john@mcdowall.info"
    @el.referer = 'google.ca'
    @el.save!

    expect { referer_was_saved_correctly }
  end

  def email_was_saved_correctly
    Glengarry::EmailLead.find_by_email(@test_email).email.should == @test_email
  end

  def referer_was_saved_correctly
    Glengarry::EmailLead.find_by_referer('google.ca').referer.should == 'google.ca'
  end

  def ip_was_saved_correctly
    Glengarry::EmailLead.find_by_email(@test_email).ip_address.should == '108.162.138.101'
  end
end
