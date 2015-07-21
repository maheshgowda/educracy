class AddLectureToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :lecture, :string
  end
end
