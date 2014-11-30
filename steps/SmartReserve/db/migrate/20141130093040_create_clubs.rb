class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :photo
      t.string :city
      t.string :web_site
      t.string :metro
      t.string :email
    end
    add_reference :clubs, :owner, index: true
    add_reference :clubs, :category, index: true
  end
end
