json.extract! appointment, :id, :client_id, :service_id, :datetime, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
