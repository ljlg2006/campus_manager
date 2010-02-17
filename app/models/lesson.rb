class Lesson < ActiveRecord::Base
  
  belongs_to :course, :class_name => "Course", :foreign_key => "course_id"
 
  validates_presence_of :name, :description, :course_id
 
  validates_uniqueness_of :name, :on => :create, :message => "is already been used" 
  
end
