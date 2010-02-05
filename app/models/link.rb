class Link < ActiveRecord::Base

	belongs_to  :course
  
	validates_presence_of :name
	validates_uniqueness_of :url
end
