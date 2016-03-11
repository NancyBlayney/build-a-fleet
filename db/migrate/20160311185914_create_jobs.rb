class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :boat_id
      t.string :name
      t.integer :containers_needed
      t.text :cargo_description
      t.string :origin
      t.string :destination
      t.decimal :price

      t.timestamps null: false
    end
  end
end
