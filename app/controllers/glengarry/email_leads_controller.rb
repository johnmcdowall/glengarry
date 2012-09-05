require_dependency "glengarry/application_controller"
require 'csv'

module Glengarry
  class EmailLeadsController < ApplicationController

    before_filter :authenticate, :except=>:create

    def index
      @email_leads = EmailLead.page(params[:page]).per(10)
      @email_lead_count = EmailLead.count

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @email_leads }
      end
    end

    def show
      @email_lead = EmailLead.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @email_lead }
      end
    end

    def create
      @email_lead = EmailLead.new(params[:email_lead])
      @email_lead.ip_address = request.ip
      @email_lead.referer = request.referer

      respond_to do |format|
        if @email_lead.save
          format.html { redirect_to :back, notice: ['Thank you.'] }
          format.json { render json: @email_lead, status: :created, location: @email_lead }
        else
          format.html { redirect_to :back, notice: @email_lead.errors }
          format.json { render json: @email_lead.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @email_lead = EmailLead.find(params[:id])
      @email_lead.destroy

      respond_to do |format|
        format.html { redirect_to email_leads_url }
        format.json { head :no_content }
      end
    end
    
    def download
      respond_to do |format|
        format.csv {
            @emails = EmailLead.all
            @columns = ["Email", "IP Address", "Referer", "Latitude", "Longitude", "City", "Country"].to_csv
            @filename = "emails-#{Date.today.to_s(:db)}"

            self.response.headers["Content-Type"] ||= 'text/csv'
            self.response.headers["Content-Disposition"] = "attachment; filename=#{@filename}"
            self.response.headers["Content-Transfer-Encoding"] = "binary"

            self.response_body = Enumerator.new do |y|
              @emails.each_with_index do |email, i|
                if i == 0
                  y << @columns
                end
                y << [email.email, email.ip_address, email.referer, email.lat, email.long, email.city, email.country].to_csv
              end
            end
          }
      end
    end
  end
end

