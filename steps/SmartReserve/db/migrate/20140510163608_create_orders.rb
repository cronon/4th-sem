class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.belongs_to :club
      t.belongs_to :table
      t.timestamps
    end
  end
end
