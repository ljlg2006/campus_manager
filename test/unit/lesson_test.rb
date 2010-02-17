require 'test_helper'

class LessonTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  fixtures :all
  
  test "Lesson require all fields" do
    l = Lesson.new
    assert !l.valid?
    
    c = Course.find(:first)
    l.course = c
    l.name = "lesson_name"
    l.description = "lesson_description"
    
  end
end
