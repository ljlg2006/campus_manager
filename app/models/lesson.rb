class Lesson < ActiveRecord::Base
	belongs_to  :course

	validates_presence_of :name
	validates_presence_of :description
end
