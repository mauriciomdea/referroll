require 'test_helper'

class JobTest < ActiveSupport::TestCase
  
  test "should not save job without owner" do
  	job = build(:job, owner: nil)
	  assert_not job.save, "Saved job without a Owner"
	  job.owner = create(:user)
	  assert job.save, "Job with Owner not saved"
	end

  test "should not save job without title" do
  	job = build(:job, title: nil)
	  assert_not job.save, "Saved job without a title"
	end

	test "new job status should be OPEN" do
  	job = create(:job)
	  assert_equal 'OPEN', job.status, "New job status is not OPEN"
	end

end
