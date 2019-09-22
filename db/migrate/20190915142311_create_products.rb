class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_product
      t.integer :quantity
      t.boolean :status
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
