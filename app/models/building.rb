class Building < ActiveRecord::Base
  
  has_many :rooms, :dependent => :destroy #the room is destroyed at the time the building is destroyed
  
  validates_presence_of :code, :name, :description
  
  validates_uniqueness_of :name, :on => :create, :message => "is already being used" 
  
end
