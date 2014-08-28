json.array!(@cartuchos) do |cartucho|
  json.extract! cartucho, :id, :title, :description, :image_url, :price, :brand, :model, :color
  json.url cartucho_url(cartucho, format: :json)
end
