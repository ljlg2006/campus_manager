require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  
  fixtures :all
  
  test "Link require all fields" do
    l = Link.new
    assert !l.valid?
    
    c = Course.find(:first)
    l.course = c
    l.name = "link_name"
    l.url = "www.link_test.com"
    
  end
end
