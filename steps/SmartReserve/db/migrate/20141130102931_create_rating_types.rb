class CreateRatingTypes < ActiveRecord::Migration
  def change
    create_table :rating_types do |t|
      t.string :name
    end
  end
end
