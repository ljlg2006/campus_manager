require 'test_helper'

class UserTest < ActiveSupport::TestCase
    
  fixtures :all
  
  test "User require all fields" do
    u = User.new 
    assert !u.valid?
    
    u.username = 'test1'
    u.password = 'test1'
    u.email = 'test1@email.com'
  end
  
  
  test "Users cannot be a Student in the same course twice concurrently" do
    s1 = Student.new
    s2 = Student.new
    
    u = User.new(:username => "student_twice", :password => "student_teice", :email => "ssss@gami.com")
    c = Course.find(:first)
    s1.user = u
    s1.course = c
    s2.user =u
    s2.course =c
    
    assert !s2.valid?
  end 
         
  test "Users can retake a Course, but only during different Semesters" do 
            
    semester1 = Semester.find(:first)
    semester2 = Semester.find(:last)
            
    student1 = Student.new
    student2 = Student.new   
            
    course = Course.find(:first)
    user = User.find(:first)
    #add first semester   
    course1 = course
    course1.semester = semester1
    student1.user = user
    student1.course = course1
    #add second semester 
    course2 = course 
    course2.semester = semester2
    student2.user = user
    student2.course = course
            
    assert student2.valid?
  end
          
          
  test "Users can be a Student in a course no more than three times" do
    semester1 = Semester.find_by_name("Spring 2010")
    semester2 = Semester.find_by_name("Fall 2010")
    semester3 = Semester.find_by_name("Spring 2011")
    semester4 = Semester.find_by_name("Fall 2011")
            
    student1 = Student.new
    student2 = Student.new
    student3 = Student.new
    student4 = Student.new
            
    course = Course.find(:last)
    user = User.new(:username => "user_twice", :password => "sss_teice", :email => "dfgg@gami.com")
            
    #first time take class
    course1 = course
    course1.semester = semester1
    student1.user = user
    student1.course = course1
    student1.save
            
    #second time take class
    course2 = course 
    course2.semester = semester2
    student2.user = user
    student2.course = course
    student2.save
            
    #third time take class
    course3 = course 
    course3.semester = semester3
    student3.user = user
    student3.course = course
    student3.save
            
    #fourth time take class
    course4 = course 
    course4.semester = semester4
    student4.user = user
    student4.course = course
    student4.save
            
    assert !student4.valid?
  end
                
  test "Users can Instruct for same Course twice as an instructor." do  
    i1 = Instructor.new
    i2 = Instructor.new
    i3 = Instructor.new
                         
    u = User.find(:first)
    c = Course.find(:last)
    i1.user = u
    i1.course = c
    i1.save  
    i2.user = u
    i2.course = c
    i2.save
    i3.user = u
    i3.course = c
    i3.save
                          
    assert !i3.valid? 
  end
                      
  test "Users cannot register for a course both as a student and instructor simultaneously." do
    #test student
    u_student = User.new(:username => "student_test", :password => "22222", :email =>"ss@11.com")
    s = Student.find(:first)
    s.user = u_student                    
    i = Instructor.find(:first)                    
    i.user = u_student                    
                        
    assert !i.valid?
                        
    #test instructor
    u_instructor = User.new(:username => "instructor_test", :password => "33333", :email =>"222@lll.com")
    i = Instructor.find(:last)
    i.user = u_instructor
                        
    s = Student.find(:last)
    s.user = u_instructor
    assert !s.valid?
                      
  end                                        
                      
                      
  test "When a Building is deleted, so are all the rooms." do
    b = Building.new(:code => "1234", :name => "test_building", :description => "2222222")
    r = Room.new
    r.building = b
    r.name = "werd_room"
    r.description = "ttteeesss"
                
    r.building.delete
    assert !r.valid?   
  end
                      
                     
                      
  test "Users must have an email addresses that is unique to their account." do
    u = User.find(:first)
    u.email="foo@bar.tld"
    user_test = User.new(:username => "12345",:password =>"12345678", :email=>'u.email')
    assert !user_test.valid?
  end
                      
  test "User Email addresses must look valid." do
    u= User.find(:first)
    u.email="foo@bar.tld"
    assert u.valid?
  end
                      
                
                
end
