class Student < ActiveRecord::Base
	belongs_to  :course
	belongs_to  :user

	validates_presence_of :course_id
	validates_presence_of :user_id
end
