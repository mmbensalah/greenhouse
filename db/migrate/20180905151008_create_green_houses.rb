class CreateGreenHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :green_houses do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
