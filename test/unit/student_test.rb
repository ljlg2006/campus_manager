require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  fixtures :all
  
  test "Student require all fields" do
    s = Student.new
    u = User.find(:last)
    c = Course.find(:last)
    s.user = u
    s.course =c 
    assert s.valid?
  end
  
  test "Users cannot be Students in more than 7 courses in a semester." do
    #the first user has two students
    u = User.find(:first)
    
    c1 = Course.find_by_name("CST 1")
    s1 = Student.new
    s1.user = u
    s1.course = c1
    s1.save
    assert s1.valid? 
    
    c2 = Course.find_by_name("CST 2")
    s2 = Student.new
    s2.user =u
    s2.course = c2
    s2.save
    assert s2.valid?
    
    c3 = Course.find_by_name("CST 3")
    s3 = Student.new
    s3.user =u
    s3.course = c3
    assert s3.valid?
    
    c4 = Course.find_by_name("CST 4")
    s4 = Student.new
    s4.user =u
    s4.course = c4
    assert s4.valid?
    
    c5 = Course.find_by_name("CST 5")
    s5 = Student.new
    s5.user =u
    s5.course = c5
    assert s5.valid?
    
    c6 = Course.find_by_name("CST 6")
    s6 = Student.new
    s6.user =u
    s6.course = c6
    assert s6.valid?
    
    c7 = Course.find_by_name("CST 7")
    s7 = Student.new
    s7.user =u
    s7.course = c7
    assert s7.valid?
    
    c8 = Course.find_by_name("CST 8")
    s8 = Student.new
    s8.user =u
    s8.course = c8
    assert s8.valid?
  end
  

  # test "User is unique in the same course" do
  #   student.add_course()
  #   student.add_user()
  #   
  #   student.add_course()
  #   student.add_user()
  #   
  # end
end
