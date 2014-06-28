require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  setup do
  	@request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
  end

  test "sets a session variable to the OmniAuth auth hash" do
    assert_equal @request.env["omniauth.auth"]['provider'], 'linkedin'
  end

  # test "sign up" do

  # 	# raise @request.env['omniauth.auth'].to_yaml

  # 	# get(:view, params, session, notice)
  # 	# get(:view, {'id' => '12'}, nil, {'message' => 'booya!'})

  # 	# @env.each do |e|
  # 	# 	puts e.to_yaml
  # 	# end
  # 	# raise "#{@env.size.to_s}"

  # 	# raise @request.nil?

  # 	# request.env = Hash.new
		# # request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
  	
  # 	# get :create, { provider: 'linkedin' }, request
  # 	# get 'auth/linkedin/callback'

  #   # assert_response :success
  	
  # 	# get :create, provider: "linkedin"
  # 	# assert_equal session[:id], User.last._id, "User not logged in"

  # end

  # test "sign in" do
  # 	//TODO
	# end

	# test "invalid sign in" do
	# 	//TODO
	# end

  test "sign out" do

  	get :destroy
  	assert_redirected_to root_path
  	assert_equal 'Signed out.', flash[:notice]

  end

end
