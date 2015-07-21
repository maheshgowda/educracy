class AddFieldsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :teacher_id, :integer
    add_column :orders, :student_id, :integer
  end
end
