class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :service
  
  validates :datetime, presence: true

end
