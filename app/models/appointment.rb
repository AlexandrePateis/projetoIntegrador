class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :service

  def near_schedule?
    return false unless date.present? && time.present?

    appointment_datetime = DateTime.new(date.year, date.month, date.day, time.hour, time.min, 0, "+00:00")
    appointment_datetime - 30.minutes <= DateTime.current
  end
end
