class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[ show edit update destroy ]

  # GET /appointments or /appointments.json
  def index
    @appointments = current_user.appointments
    @upcoming_appointments = current_user.appointments.where('datetime >= ? AND datetime <= ?', DateTime.current, 2.minutes.from_now)
  end

  def upcoming
    binding.pry
    @upcoming_appointments = Appointment.where('datetime >= ? AND datetime <= ?', DateTime.current, 2.minutes.from_now)
    respond_to do |format|
      format.js
    end
  end

  # GET /appointments/1 or /appointments/1.json
  def show
    @appointment = current_user.appointments.find(params[:id])
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments or /appointments.json
  def create
    @appointment = current_user.appointments.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Criado com sucesso!" }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy!

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Deletado com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:client_id, :service_id, :datetime, :description)
    end
end
