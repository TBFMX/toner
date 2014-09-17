class AddColumnsToCartuchos < ActiveRecord::Migration
  def change
  	add_column :cartuchos, :price_40, :decimal,precision: 8, scale: 2
  	add_column :cartuchos, :price_21, :decimal,precision: 8, scale: 2
  	add_column :cartuchos, :price_10, :decimal,precision: 8, scale: 2
  end
end
