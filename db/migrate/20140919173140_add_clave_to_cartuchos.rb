class AddClaveToCartuchos < ActiveRecord::Migration
  def change
  	add_column :cartuchos, :clave, :string
  	add_column :cartuchos, :rendimiento, :integer
  end
end
