# This migration comes from glengarry (originally 20121001002851)
class AddActiveAndActivationTokenToEmailLeads < ActiveRecord::Migration
  def change
    add_column :glengarry_email_leads, :active, :boolean, :default=>false
    add_column :glengarry_email_leads, :activation_token, :string, :default=>""
  end
end
