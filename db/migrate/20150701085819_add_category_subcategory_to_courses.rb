class AddCategorySubcategoryToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :category_id, :integer
    add_column :courses, :subcategory_id, :integer
  end
end
