# Migration responsible for creating a table with activities
class CreateUsers < ActiveRecord::Migration[5.1]
  # Create table
  def change
    create_table :users do |t|
      t.string 	:name
      t.timestamps
    end
  end
end
