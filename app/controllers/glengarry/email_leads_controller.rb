require_dependency "glengarry/application_controller"

module Glengarry
  class EmailLeadsController < ApplicationController
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
          format.json { render json: @email_lead.errors, status: :invalid_email }
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
  end
end

