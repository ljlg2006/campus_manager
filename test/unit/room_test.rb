require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  fixtures :all
  
  test "room require all fields" do
    r = Room.new
    b = Building.find(:first)
    r.building = b
    r.name = '123'
    r.description = 'room test'
    
    assert r.valid?
  end
  
end
