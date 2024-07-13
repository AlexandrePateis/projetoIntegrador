class ApplicationController < ActionController::Base
  before_action :set_notifications
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def set_notifications
    now = DateTime.now
    today_beginning = now.beginning_of_day
    today_end = now.end_of_day
    @upcoming_appointments = Appointment.where('datetime >= ? AND datetime < ? AND datetime > ?', today_beginning, today_end, now)
  end
end
