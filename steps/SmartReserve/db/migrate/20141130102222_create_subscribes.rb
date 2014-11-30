class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes
    add_reference :subscribes, :club, :index => true
    add_reference :subscribes, :user, :index => true
  end
end
