class CreatePlants < ActiveRecord::Migration[5.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :variety
      t.integer :sell_quantity
      t.integer :stock_plants
      t.string :zone
      t.string :shipping

      t.timestamps
    end
  end
end
