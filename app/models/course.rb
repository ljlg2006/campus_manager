class Course < ActiveRecord::Base
	has_many  :instructors, :dependent => :destroy
	has_many  :students,    :dependent => :destroy
	has_many  :lessons,     :dependent => :destroy
	has_many  :links,       :dependent => :destroy
	belongs_to  :semester
	belongs_to  :room

	validates_presence_of :name
	validates_presence_of :description
	validates_presence_of :semester
	validates_presence_of :room
end
