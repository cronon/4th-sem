class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.string :avatar_url
      t.decimal :average_price

      t.timestamps
    end
  end
end
