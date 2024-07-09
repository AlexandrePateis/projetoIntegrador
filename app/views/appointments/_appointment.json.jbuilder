json.extract! appointment, :id, :client_id, :service_id, :date, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
