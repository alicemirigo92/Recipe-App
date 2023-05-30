json.extract! food, :id, :name, :measurement-unit, :price, :quantity, :User_id, :created_at, :updated_at
json.url food_url(food, format: :json)
