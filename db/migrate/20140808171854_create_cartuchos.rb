class CreateCartuchos < ActiveRecord::Migration
  def change
    create_table :cartuchos do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
      t.string :brand
      t.string :model
      t.string :color

      t.timestamps
    end
  end
end
