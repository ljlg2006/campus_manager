class Instructor < ActiveRecord::Base
	belongs_to  :course
	belongs_to  :user

	validates_presence_of :course
	validates_presence_of :user

end
