# app/controllers/reports_controller.rb
class ReportsController < ApplicationController
  def index
    @clients = Client.all
    @services = Service.all
    @appointments = Appointment.all

    if params[:client_id].present?
      @appointments = @appointments.where(client_id: params[:client_id])
    end

    if params[:service_id].present?
      @appointments = @appointments.where(service_id: params[:service_id])
    end

    @total_price = @appointments.joins(:service).sum("services.price")
  end
end