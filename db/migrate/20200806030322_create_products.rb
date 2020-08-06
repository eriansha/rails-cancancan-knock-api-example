class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :category
      t.string :colour
      t.string :condition
      t.decimal :price
      t.integer :quantity
    end
  end
end
