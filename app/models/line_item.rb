class LineItem < ActiveRecord::Base
  belongs_to :cartucho
  belongs_to :cart

  def total_price
	cartucho.price * quantity
  end
  
end
