class CreatePrinters < ActiveRecord::Migration
  def change
    create_table :printers do |t|
      t.string :brand
      t.string :model
      t.string :brand_model

      t.timestamps
    end
  end
end
