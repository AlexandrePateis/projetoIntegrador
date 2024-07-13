class Client < ApplicationRecord
  has_many :appointments
  belongs_to :user

  has_many :services, through: :appointments
  belongs_to :address
  accepts_nested_attributes_for :address
end
