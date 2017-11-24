# Migration responsible for creating a table with activities
class CreateLocations < ActiveRecord::Migration[5.1]
  # Create table
  def change
    create_table :locations do |t|
      t.string 	:address
      t.timestamps
    end
  end
end
