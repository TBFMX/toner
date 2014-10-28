class AddColumnToCartuchos < ActiveRecord::Migration
  def change
    add_column :cartuchos, :impresoras, :string
    add_column :cartuchos, :precio_original, :string
  end
end
