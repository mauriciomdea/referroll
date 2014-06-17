Rails.application.config.middleware.use OmniAuth::Builder do

	OmniAuth.config.logger = Rails.logger

  # provider :developer unless Rails.env.production?
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

  # Linkedin
  provider	:linkedin, 	Rails.application.secrets.linkedin_key, 
  											Rails.application.secrets.linkedin_secret, 
						  					scope: 'r_fullprofile r_emailaddress', 
						  					secure_image_url: true, 
						  					provider_ignores_state: true


end