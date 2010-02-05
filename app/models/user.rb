class User < ActiveRecord::Base
	has_many  :instructors
	has_many  :students
	
	validates_presence_of :name
	validates_presence_of :password
	validates_presence_of :email
	
end
