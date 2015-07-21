class Order < ActiveRecord::Base
    validates :address, :city, :state, presence: true
    
    belongs_to :course
    belongs_to :student, class_name: "User"
    belongs_to :teacher, class_name: "User"
end
