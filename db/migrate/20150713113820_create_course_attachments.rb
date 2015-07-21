class CreateCourseAttachments < ActiveRecord::Migration
  def change
    create_table :course_attachments do |t|
      t.integer :course_id
      t.string :video

      t.timestamps
    end
  end
end
