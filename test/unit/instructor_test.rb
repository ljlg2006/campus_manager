require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  fixtures :all
  
  test "Instructor require all fields" do
    i = Instructor.new
    
    
    u = User.find(:first)
    c = Course.find(:first)
    i.user = u
    i.course =c
    assert i.valid?
  end
end
