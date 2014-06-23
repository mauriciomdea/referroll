require 'test_helper'

class UserTest < ActiveSupport::TestCase

	setup do
    # 
  end

  test "should create new user from omniauth hash" do
  	auth = OmniAuth.config.mock_auth[:linkedin]
  	User.from_omniauth(auth)
  	user = User.last
  	email = ""
  	auth.slice(:provider, :uid).try do
  		email = auth.info.email
  	end
  	assert_equal email, user.email, "User not found"
	end

	test "should create new authentication for same email" do
		auth_from_linkedin = OmniAuth.config.mock_auth[:linkedin]
		user_from_linkedin = User.from_omniauth(auth_from_linkedin)
		auth_from_google = OmniAuth.config.mock_auth[:google]
		user_from_google = User.from_omniauth(auth_from_google)
		assert_equal user_from_linkedin._id, user_from_google._id, "Different users found"
		assert_equal 2, user_from_google.authentications.size, "Incorrent number of authentications for user"
		second_login_from_google = User.from_omniauth(auth_from_google)
		assert_equal 2, user_from_google.authentications.size, "Incorrent number of authentications for user after second login"
	end

end
