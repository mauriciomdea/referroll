require 'test_helper'

class UserTest < ActiveSupport::TestCase

	setup do
		@user_from_linkedin = User.from_omniauth(OmniAuth.config.mock_auth[:linkedin])
		@user_from_google = User.from_omniauth(OmniAuth.config.mock_auth[:google])
  end

  test "should create new user from omniauth hash" do
  	# assert_equal 1, User.all.size, "Wrong number of total users"
  	assert_equal "mauriciomdea@gmail.com", @user_from_linkedin.email, "User not found"
	end

	test "should create new authentication for same email/user" do
		assert_equal @user_from_linkedin._id, @user_from_google._id, "Different users found"
		assert_equal 2, @user_from_google.authentications.size, "Incorrent number of authentications for user"
	end

	test "should authenticate user with existing authentication" do
		login_from_google = User.from_omniauth(OmniAuth.config.mock_auth[:google])
		assert login_from_google, "Did not retrive user from authentication"
		assert_equal 2, @user_from_google.authentications.size, "Incorrent number of authentications for user after second login"
	end

end
