class Student < ActiveRecord::Base
  
  belongs_to :course
  belongs_to :user
  
  validates_presence_of :course_id, :user_id
  
  validate :question_2_3_4_10, :no_more_than_7_courses_per_semester
  
  $count_semester = 0
  $count_7_course = 0
  def question_2_3_4_10 
    course.students.each do |a|    
      if user_id == a.user_id && course_id == a.course_id
        if course.semester_id == a.course.semester_id
          errors.add_to_base("Users cannot be a Student in the same course twice concurrently")
        end
        if course.semester_id != a.course.semester_id then
           $count_semester = $count_semester + 1
           errors.add_to_base("can not choose more than three semesters") if $count_semester>3
        end
      end
      if user_id == a.user_id && course_id != a.course_id && course.semester_id == a.course.semester_id
         $count_7_course+=1
         errors.add_to_base("Users cannot be Students in more than 7 courses in a semester") if $count_7_course >7
      end

    end

  end
  
  # validate :no_more_than_7_courses_per_semester
  # $count_per_semester =0
  def no_more_than_7_courses_per_semester
     # if user_id == self.user_id && course.semester_id == self.course.semester_id
     #   puts "------"
     #   $count_per_semester +=1
     #   errors.add_to_base("Users cannot be Students in more than 7 courses in a semester") if $count_per_semester >7
     # end
    #         puts user.students.count
    # user.students.each do |student|
    #    puts student.course.name
    # 
    #   errors.add_to_base("Users cannot be Students in more than 7 courses in a semester") if student.course.semester.courses.count > 7
    # end
  end

end
