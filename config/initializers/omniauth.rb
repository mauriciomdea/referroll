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

  # Google
  provider 	:google_oauth2, Rails.application.secrets.google_client_id, 
  													Rails.application.secrets.google_client_secret, 
												    {
												      name: "google",
												      scope: "email, profile, plus.me",
												      prompt: "select_account",
												      image_aspect_ratio: "square",
												      image_size: 64
												    }

end