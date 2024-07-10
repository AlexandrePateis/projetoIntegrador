class ApplicationController < ActionController::Base
    before_action :set_notifications

    private
  
    def set_notifications
      @upcoming_appointments = Appointment.where('date >= ? AND date <= ?', DateTime.now, 30.minutes.from_now)
    end
end
