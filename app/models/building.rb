class Building < ActiveRecord::Base
	has_many  :rooms, :dependent => :destroy
  
	validates_presence_of  :code
	validates_presence_of  :name
	validates_presence_of  :dsecription
end
