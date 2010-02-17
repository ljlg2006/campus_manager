class Course < ActiveRecord::Base
  
  has_many :instructors, :dependent => :destroy
  has_many :students, :dependent => :destroy
  has_many :lessons, :dependent => :destroy
  has_many :links, :dependent => :destroy
  
  belongs_to :semester
  belongs_to :room
  
  validates_presence_of :name, :description, :semester_id, :room_id
  
  validates_uniqueness_of :name
  
  validate :room_less_than_25_courses_per_semester
  $count_25_courses =0
  def room_less_than_25_courses_per_semester
    if room_id == self.room_id && semester_id == self.semester_id
      $count_25_courses += 1
      if $count_25_courses > 25 
        errors.add_to_base("Rooms cannot be used for more than 25 Courses per Semester.")
      end           
    end
  end
  
end
