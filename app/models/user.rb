class User < ActiveRecord::Base

  has_many :instructors
  has_many :students
  
  validates_format_of :email, :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
  
  validates_uniqueness_of :username, :email
    
  validate :question_6
  def question_6
    if self.instructors.count >0 
      errors.add_to_base("Users cannot register for a course both as a student and instructor simultaneously") if students.count >0
    elsif students.count >0
      errors.add_to_base("Users cannot register for a course both as a student and instructor simultaneously") if instructors.count >0
    end
  end   
 
end
