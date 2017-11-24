# Migration responsible for creating a table with activities
class CreateGroups < ActiveRecord::Migration[5.1]
  # Create table
  def change
    create_table :groups do |t|
      t.string 	:name
      t.timestamps
    end
  end
end
