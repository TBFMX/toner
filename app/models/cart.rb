class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def add_cartucho(cartucho_id,qty)
		current_item = line_items.find_by(cartucho_id: cartucho_id)
		if current_item
			current_item.quantity = qty
		else
			current_item = line_items.build(cartucho_id: cartucho_id)
		end
		current_item
	end

	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end

end
