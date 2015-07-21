class AddVideoToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :video, :string
  end
end
