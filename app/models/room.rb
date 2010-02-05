class Room < ActiveRecord::Base
	has_many  :courses # Do not cascade delete courses when removing a room!!!
	belongs_to  :building

	validates_presence_of  :building_id
	validates_presence_of  :name

  
	#validates_uniqueness_of  :building, :scope => [:name] # Only allow one room of a given name per building.
end
