class Semester < ActiveRecord::Base
  
  has_many :courses
  
  validates_presence_of :name
  
  validates_uniqueness_of :name, :on => :create, :message => "is already been used" 
   
end
