class CreateGlengarryEmailLeads < ActiveRecord::Migration
  def change
    create_table :glengarry_email_leads do |t|
      t.string :email
      t.string :ip_address
      t.string :referer
      t.float :lat
      t.float :long
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
