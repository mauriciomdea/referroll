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

  # def test_user_from_omniauth

  # 	num_of_users = User.count
  # 	auth = OmniAuth.config.mock_auth[:linkedin]
  # 	User.from_omniauth(auth)
  # 	assert_equal num_of_users+1, User.count
  	
  # 	user = User.last
  # 	email = ""
  # 	auth.slice(:provider, :uid).try do
  # 		email = auth.info.email
  # 	end
  # 	assert_equal email, user.email

  # end

  # def test_same_user_from_different_service

  # 	auth = OmniAuth.config.mock_auth[:google]
  # 	User.from_omniauth(auth)
  # 	assert_equal User.first, User.last, "Two authentications, same user"
  # 	assert_equal User.first.authentications.size, 2, "Same user, two authentications"

  # end

end
