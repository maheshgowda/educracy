class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :courses
  has_many :reviews
  validates :name, presence: true
  has_many :sales, class_name: "Order", foreign_key: "teacher_id"
  has_many :purchases, class_name: "Order", foreign_key: "student_id"
end
