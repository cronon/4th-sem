class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.timestamp :created_at
    end
    add_reference :news, :club, :index => true
  end
end
