ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  # Add more helper methods to be used by all tests here...

  # Cleaning damned MongoDB test database
  Mongoid.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)

  # Omniauth mock auth data

  OmniAuth.config.add_mock(:linkedin, {
  	provider: "linkedin", 
  	uid: "59DSCl-uxu", 
  	info: {
  		name: "Mauricio Almeida", 
  		email: "mauriciomdea@gmail.com", 
  		image: "http://m.c.lnkd.licdn.com/mpr/mprx/0_Y7bJr1wE7PcmHRN1ySzorKE4SBtfERN1yDPQrleZtNQ0vx_P-WBzYApn_0-rdpv0xu5F09sW2Ui-", 
  		urls: {
  			public_profile: "http://www.linkedin.com/in/mauriciomdea"
  		}
  	}
  })

  # OmniAuth.config.add_mock(:google_professional, {
  # 	provider: "google", 
  # 	uid: "101544200514332279834", 
  # 	info: {
  # 		name: "Mauricio Almeida", 
  # 		email: "mma@brandnewcode.com.br", 
  # 		image: "https://lh3.googleusercontent.com/-9bHixiaPSZg/AAAAAAAAAAI/AAAAAAAAAEo/6P1yjqCV60g/s64-c/photo.jpg?sz=50"
  # 	}
  # })

  OmniAuth.config.add_mock(:google, {
  	provider: "google", 
  	uid: "105400735053348029602", 
  	info: {
  		name: "Mauricio Almeida", 
  		email: "mauriciomdea@gmail.com", 
  		image: "https://lh4.googleusercontent.com/-8oB5RAyd0sI/AAAAAAAAAAI/AAAAAAAABEY/_kg0yQvxOD0/s64-c/photo.jpg?sz=50"
  	}
  })

end
