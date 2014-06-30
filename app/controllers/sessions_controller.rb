class SessionsController < ApplicationController

  def create

    # raise env['omniauth.auth'].to_yaml
    user = nil
    if user = User.from_omniauth(env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Signed in."
    else
      redirect_to sign_in_url, notice: "Authentication failed."
    end

  end

  # def create

  #   auth = request.env['omniauth.auth']
  #   raise env['omniauth.auth'].to_yaml
  #   # Find an authentication here
  #   @authentication = Authentication.find_with_omniauth(auth)

  #   if @authentication.nil?
  #     # If no authentication was found, create a brand new one here
  #     @authentication = Authentication.create_with_omniauth(auth)
  #   end

  #   if signed_in?
  #     if @authentication.user == current_user
  #       # User is signed in so they are trying to link an authentication with their
  #       # account. But we found the authentication and the user associated with it 
  #       # is the current user. So the authentication is already associated with 
  #       # this user. So let's display an error message.
  #       redirect_to user_path(current_user), notice: "Already linked that account!"
  #     else
  #       # The authentication is not associated with the current_user so lets 
  #       # associate the authentication
  #       @authentication.user = current_user
  #       @authentication.save()
  #       redirect_to user_path(user), notice: "Successfully linked accounts!"
  #     end
  #   else
  #     if @authentication.user.present?
  #       # The authentication we found had a user associated with it so let's 
  #       # just log them in here
  #       self.current_user = @authentication.user
  #       redirect_to user_path(current_user), notice: "Signed in!"
  #     else
  #       # No user associated with the authentication so we need to create a new one
  #       user = User.from_omniauth(env['omniauth.auth'])
  #       self.current_user = user
  #       redirect_to user_path(user), notice: "Sign Up successful!"
  #     end
  #   end

  # end

  def destroy

    self.current_user = nil
	  redirect_to sign_in_url, notice: "Signed out."
	  
	end

end
