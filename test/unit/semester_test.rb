require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  fixtures :all
  
  test "Semester require all fields" do
    s = Semester.new
    assert !s.valid?
    
    s.name = 'Spring 2011'
    s.start_date = '2011-01-01'
    s.end_date = '2011-06-01'
    #assert s.valid?
  end
  
end
