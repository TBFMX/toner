class ChangePriceType < ActiveRecord::Migration
  def change
  	change_column(:cartuchos, :price, :decimal)
  end
end
