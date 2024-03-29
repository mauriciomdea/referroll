require 'test_helper'

class JobTest < ActiveSupport::TestCase
  
  test "should not save job without owner" do
  	job = build(:job, owner: nil)
	  assert_not job.save, "Saved job without a Owner"
	  job.owner = create(:authentication).user
	  assert job.save, "Job with Owner not saved"
	end

  test "should not save job without title" do
  	job = build(:job, title: nil)
	  assert_not job.save, "Saved job without a title"
	end

	test "should set Job status as open during creation" do
  	job = create(:job)
	  assert_equal 'Open', job.status.text, "New job status is not open"
	end

end
