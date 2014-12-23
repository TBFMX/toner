class ChangeTypeOfPriceInCartuchos < ActiveRecord::Migration
  def change
  	change_column(:cartuchos, :price, :string)
  	
  end
end
