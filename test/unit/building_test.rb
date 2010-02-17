require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
    
  fixtures :all
  
  test "Building require all fields" do
    b = Building.new
    assert !b.valid?
    
    b.code = 'santan'
    b.name = 'santan_Building_Test'
    b.description = 'this is building test'
    
    #assert b.valid? 
  end
  
  test "Buildings cannot have two rooms with the same name" do
    r = Room.find(:first)
    b = r.building
    
    r_test = Room.new
    r_test.building =b
    r_test.name = r.name
    r_test.description = "11111"
  
    assert !r_test.valid?
  end
  
  test "Two Rooms can have the same name, but only if they are in different buildings." do
    b_first = Building.find(:first)
    b_last = Building.find(:last)
    
    r = Room.find_by_name("80")
    r.building = b_first
    r.building = b_last
    
    assert r.valid?
  end
end
