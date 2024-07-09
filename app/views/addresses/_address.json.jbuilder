json.extract! address, :id, :street, :city, :state, :postal_code, :neighborhood, :created_at, :updated_at
json.url address_url(address, format: :json)
