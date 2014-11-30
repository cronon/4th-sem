class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :seats
    end
    add_reference :tables, :club, :index => true
  end
end
