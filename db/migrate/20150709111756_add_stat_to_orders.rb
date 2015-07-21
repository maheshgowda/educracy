class AddStatToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :stat, :string
  end
end
