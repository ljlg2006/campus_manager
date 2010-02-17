class Instructor < ActiveRecord::Base
  
  belongs_to :course, :class_name => "Course", :foreign_key => "course_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  
  validates_presence_of :course_id, :user_id
  
  $count_instruct =0
  $count_per_semester =0
  validate :question_5
  def question_5
    if user_id == self.user_id && course_id == self.course_id
      $count_instruct +=1
      errors.add_to_base("can not choose more than three semesters") if $count_instruct >2
    end
    if user_id == self.user_id && course.semester_id == self.course.semester_id
      $count_per_semester +=1
      errors.add_to_base("can not instruct more than 6 course per semesters") if $count_per_semester >6
    end
  end
  
end
