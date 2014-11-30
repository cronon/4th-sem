class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.timestamp :created_at
    end
    add_reference :comments, :user, :index => true
    add_reference :comments, :club, :index => true
  end
end
