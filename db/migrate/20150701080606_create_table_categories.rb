class CreateTableCategories < ActiveRecord::Migration
  def change
    create_table :table_categories do |t|
      t.string :name
    end
  end
end
