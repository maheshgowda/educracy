class Course < ActiveRecord::Base
    has_many :course_attachments
    accepts_nested_attributes_for :course_attachments
    validates :name, presence: true
    validates :description, presence: true
    validates :lecture, presence: true
    mount_uploader :image, ImageUploader
    has_many :users
    has_many :reviews
    belongs_to :category
    belongs_to :subcategory
    has_many :orders
    def self.search(params)
      courses = Course.where(params[:course])
      courses = courses.where(" name like ? or lecture like ?", "%#{params[:search]}%","%#{params[:search]}%") if params[:search].present? 
    end
end
