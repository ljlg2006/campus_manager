class Room < ActiveRecord::Base
  
  has_many :courses
  belongs_to :building, :class_name => "Building", :foreign_key => "building_id" 
  
  validates_presence_of :building_id, :name
  
  validates_uniqueness_of :building_id, :scope => [:name]
  
  validate :room_can_not_have_same_name_per_building 
  def room_can_not_have_same_name_per_building
    building.rooms.each do |a|
      if(self.name == a.name)
        errors.add_to_base("Buildings cannot have two rooms with the same name.")
      end
    end
  end
  
end
