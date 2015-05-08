class ChangePriceType < ActiveRecord::Migration
  def change
	remove_column :cartuchos, :price, :string
	add_column :cartuchos, :price, :decimal
  end
end
