class CourseAttachment < ActiveRecord::Base
    mount_uploader :video, VideoUploader
    belongs_to :course
end
