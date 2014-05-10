class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :seats
      t.belongs_to :club
      t.timestamps
    end
  end
end
