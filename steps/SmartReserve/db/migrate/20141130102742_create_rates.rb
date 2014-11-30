class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :stars
    end
    add_reference :rates, :club, :index => true
    add_reference :rates, :rating_type, :index => true
    add_reference :rates, :user, :index => true
  end
end
