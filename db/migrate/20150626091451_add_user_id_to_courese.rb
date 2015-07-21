class AddUserIdToCourese < ActiveRecord::Migration
  def change
    add_column :coureses, :user_id, :integer
  end
end
