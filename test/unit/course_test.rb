require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  fixtures :all
  
  test "Course require all fields" do
    
    c = Course.new
    # assert !c.valid?
    
    r = Room.find(:last)
    s = Semester.find(:last)    
    c.room = r
    c.semester = s
    c.name ="Course_name"
    c.description = "Course_description"  
    assert c.valid?
  end 
  
  test "Rooms cannot be used for more than 25 Courses per Semester." do
    r = Room.new
    b = Building.find(:first)
    r.building = b
    r.name = '123'
    r.description = 'room test'

    $count_room =0
    c = Course.find(:all)
    c.each do |course|
     # puts course.name
     $count_room += 1
     course.room = r
     course.semester_id = "201103"
     course.save
     if $count_room >26
       break
     end
    end
    
    assert !r.valid?
  end
 
end
