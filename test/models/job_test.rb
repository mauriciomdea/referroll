require 'test_helper'

class JobTest < ActiveSupport::TestCase
  
  test "should not save job without title" do
  	job = create(:job, title: nil)
	  assert_not job.save, "Saved job without a title"
	end

end
