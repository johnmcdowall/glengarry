require_dependency "glengarry/application_controller"

module Glengarry
  class EmailLeadsController < ApplicationController
    # GET /email_leads
    # GET /email_leads.json
    def index
      @email_leads = EmailLead.page(params[:page]).per(10)
      @email_lead_count = EmailLead.count

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @email_leads }
      end
    end

    # GET /email_leads/1
    # GET /email_leads/1.json
    def show
      @email_lead = EmailLead.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @email_lead }
      end
    end

    # POST /email_leads
    # POST /email_leads.json
    def create
      @email_lead = EmailLead.new(params[:email_lead])
      @email_lead.set_ip_and_referer(request.ip, request.referer)

      respond_to do |format|
        if @email_lead.save
          format.html { redirect_to @email_lead, notice: 'Email lead was successfully created.' }
          format.json { render json: @email_lead, status: :created, location: @email_lead }
        else
          format.html { render action: "new" }
          format.json { render json: @email_lead.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /email_leads/1
    # DELETE /email_leads/1.json
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

