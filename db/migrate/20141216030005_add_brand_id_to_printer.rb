class AddBrandIdToPrinter < ActiveRecord::Migration
  def change
    add_column :printers, :brand_id, :integer
  end
end
