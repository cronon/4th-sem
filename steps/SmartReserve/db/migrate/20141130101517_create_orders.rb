class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.time :time
      t.string :confirmation
      t.text :comment
    end
    add_reference :orders, :user, :index => true
    add_reference :orders, :table, :index => true
  end
end
