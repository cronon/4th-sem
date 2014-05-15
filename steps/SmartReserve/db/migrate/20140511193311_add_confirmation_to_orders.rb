class AddConfirmationToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :confirmation_code, :string
    add_column :orders, :confirmed, :boolean
  end
end
