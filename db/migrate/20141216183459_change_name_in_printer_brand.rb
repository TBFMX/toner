class ChangeNameInPrinterBrand < ActiveRecord::Migration
  def change
  	rename_column(:printers, :brand, :brand_name)
  end
end
