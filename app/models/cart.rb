class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def make_items(cart_id, cartucho_id, quantity)
    current_item = line_items.find_by(cart_id: cart_id, cartucho_id: cartucho_id)
    
    if current_item
      current_item.quantity += 1
      current_item.save
    else
      current_item = line_items.create(cart_id: cart_id, cartucho_id: cartucho_id, quantity: quantity)
    end
    current_item
  end

  def empty?
    line_items.empty?
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price.to_s.delete('$ ,').to_f }
  end

end
