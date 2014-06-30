ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# With this line in place we can remove FactoryGirl. and call create() directly
include FactoryGirl::Syntax::Methods

class TestCase

  # Add more helper methods to be used by all tests here...

  # Cleaning damned MongoDB test database
  Mongoid.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)

  # Omniauth mock auth data
  OmniAuth.config.mock_auth[:invalid] = :invalid_credentials

  OmniAuth.config.add_mock(:linkedin, {
  	provider: "linkedin",
		uid: "59DSCl-uxu",
		info: {
		  name: "Mauricio Almeida",
		  email: "mauriciomdea@gmail.com",
		  nickname: "Mauricio Almeida",
		  first_name: "Mauricio",
		  last_name: "Almeida",
		  location: {
		    country: {
		      code: "br"
		    },
		    name: "São Paulo Area, Brazil"
		  },
		  description: "Sócio Diretor na Brand New Code",
		  image: "http://m.c.lnkd.licdn.com/mpr/mprx/0_Y7bJr1wE7PcmHRN1ySzorKE4SBtfERN1yDPQrleZtNQ0vx_P-WBzYApn_0-rdpv0xu5F09sW2Ui-",
		  urls: {
		    public_profile: "http://www.linkedin.com/in/mauriciomdea"
		  }
		},
		credentials: {
		  token: "AQVxXJCX00Sv0RI8YX8GHijfDwHnQa-0yYpQub16-LF_oE9FevbkFiVObDeCl2sc9lgiI0uBZsjOoBT5TvK-2gfQ1PvMjEaTuRvE8loMUSXffSakoBFHyXeQxQVTigp0HOo7O8YSIqXW7VHFuue6QuEUbyYwCcyV9HI0tHkbdVPtChLv2OM",
		  expires_at: "1408692717",
		  expires: "true"
		},
		extra: {
		  raw_info: {
		    emailAddress: "mauriciomdea@gmail.com",
		    firstName: "Mauricio",
		    headline: "Sócio Diretor na Brand New Code",
		    id: "59DSCl-uxu",
		    industry: "Information Technology and Services",
		    lastName: "Almeida",
		    location: {
		      country: {
		        code: "br"
		      },
		      name: "São Paulo Area, Brazil"
		    },
		    pictureUrl: "http://m.c.lnkd.licdn.com/mpr/mprx/0_Y7bJr1wE7PcmHRN1ySzorKE4SBtfERN1yDPQrleZtNQ0vx_P-WBzYApn_0-rdpv0xu5F09sW2Ui-",
		    publicProfileUrl: "http://www.linkedin.com/in/mauriciomdea"
		  }
		}
  })

  OmniAuth.config.add_mock(:google, {
  	provider: 'google',
		uid: '105400735053348029602',
		info: {
		  name: 'Mauricio Almeida',
		  email: 'mauriciomdea@gmail.com',
		  first_name: 'Mauricio',
		  last_name: 'Almeida',
		  image: 'https://lh4.googleusercontent.com/-8oB5RAyd0sI/AAAAAAAAAAI/AAAAAAAABEY/_kg0yQvxOD0/s64-c/photo.jpg?sz=50',
		  urls: {
		    Google: 'https://plus.google.com/105400735053348029602'
		  }
		},
		credentials: {
		  token: 'ya29.LgAfooD0OdUodBsAAADjKQWoWzwhU2TECgP6IqYHrMVAVSSiZlQfiN3IR-_Usg',
		  expires_at: '1403652718',
		  expires: 'true'
		},
		extra: {
		  id_token: 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImUxYjFiNDg1OTFlODE0MTk4NmE0Mjc4NmJmODIxZTljZTM4N2E3ODgifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWQiOiIxMDU0MDA3MzUwNTMzNDgwMjk2MDIiLCJzdWIiOiIxMDU0MDA3MzUwNTMzNDgwMjk2MDIiLCJhenAiOiI5NDc1NjgwNzAyMDUtNG4yMmtja3ZzNjRycWpzdnB1Mm4zbnZtNGRra2Zmc3MuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJlbWFpbCI6Im1hdXJpY2lvbWRlYUBnbWFpbC5jb20iLCJhdF9oYXNoIjoiZGRmYW16YXNBZ1k2M0lsRnpBc01xQSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdWQiOiI5NDc1NjgwNzAyMDUtNG4yMmtja3ZzNjRycWpzdnB1Mm4zbnZtNGRra2Zmc3MuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJ0b2tlbl9oYXNoIjoiZGRmYW16YXNBZ1k2M0lsRnpBc01xQSIsInZlcmlmaWVkX2VtYWlsIjp0cnVlLCJjaWQiOiI5NDc1NjgwNzAyMDUtNG4yMmtja3ZzNjRycWpzdnB1Mm4zbnZtNGRra2Zmc3MuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJpYXQiOjE0MDM2NDg4MTgsImV4cCI6MTQwMzY1MjcxOH0.xrvBbREteMmnk0XR8F-sj7DFYQvQ6CKOTXqditG3Fw-H5cfdy9QAx5xJ7A6DmP6LKMc0k6UhgnCT37E7DycD47M0snzGUDIJSoQgXJ7ZQy21gEb_rXCMC4fBgQJS2EjxkAnAVZCrMYgjIVNtgQTdwYsAgjOp0YegaMjiLaIEcEU',
		  raw_info: {
		    kind: 'plus#personOpenIdConnect',
		    gender: 'male',
		    sub: '105400735053348029602',
		    name: 'Mauricio Almeida',
		    given_name: 'Mauricio',
		    family_name: 'Almeida',
		    profile: 'https://plus.google.com/105400735053348029602',
		    picture: 'https://lh4.googleusercontent.com/-8oB5RAyd0sI/AAAAAAAAAAI/AAAAAAAABEY/_kg0yQvxOD0/photo.jpg?sz=50',
		    email: 'mauriciomdea@gmail.com',
		    email_verified: 'true',
		    locale: 'pt-BR'
		  }
		}
  })

	# OmniAuth.config.mock_auth[:priscila] = {
	# 	'provider' => 'google',
	# 	'uid' => '102492263388954313581',
	# 	'info' => {
	# 	  'name' => 'Priscila Queiroz',
	# 	  'email' => 'poqueiroz@gmail.com',
	# 	  # first_name: 'Priscila',
	# 	  # last_name: 'Queiroz',
	# 	  'image' => 'https://lh6.googleusercontent.com/-nPD97CqBKlI/AAAAAAAAAAI/AAAAAAAA0fw/0odv_4qWhc0/s64-c/photo.jpg?sz=50',
	# 	  # urls: {
	# 	  #   Google: 'https://plus.google.com/+PriscilaQueiroz'
	# 	  # }
	# 	}
	# 	# },
	# 	# credentials: {
	# 	#   token: 'ya29.LgAXuPsBZEnbmx8AAAASqnFQUUUFlrj-syxZiMOG4nUpuMNsxY7FagvFRd28ug',
	# 	#   refresh_token: '1/fApnXQxHAwn_qwTz-yPeh6rOuK_6FCbyDgVQ9QR4pOQ',
	# 	#   expires_at: '1403659847',
	# 	#   expires: 'true'
	# 	# },
	# 	# extra: {
	# 	#   id_token: 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImUxYjFiNDg1OTFlODE0MTk4NmE0Mjc4NmJmODIxZTljZTM4N2E3ODgifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWQiOiIxMDI0OTIyNjMzODg5NTQzMTM1ODEiLCJzdWIiOiIxMDI0OTIyNjMzODg5NTQzMTM1ODEiLCJhenAiOiI5NDc1NjgwNzAyMDUtNG4yMmtja3ZzNjRycWpzdnB1Mm4zbnZtNGRra2Zmc3MuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJlbWFpbCI6InBvcXVlaXJvekBnbWFpbC5jb20iLCJhdF9oYXNoIjoiRmdaeUxVVEVmTnZRX08zZG5LeHo5USIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdWQiOiI5NDc1NjgwNzAyMDUtNG4yMmtja3ZzNjRycWpzdnB1Mm4zbnZtNGRra2Zmc3MuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJ0b2tlbl9oYXNoIjoiRmdaeUxVVEVmTnZRX08zZG5LeHo5USIsInZlcmlmaWVkX2VtYWlsIjp0cnVlLCJjaWQiOiI5NDc1NjgwNzAyMDUtNG4yMmtja3ZzNjRycWpzdnB1Mm4zbnZtNGRra2Zmc3MuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJpYXQiOjE0MDM2NTU5NDcsImV4cCI6MTQwMzY1OTg0N30.yTgGdKuHvyxcj7kbRpd5EMaP1XiujYgYEFx3KEU-olRQcnUHXgZnFYxoMkUkrnYTdTIjrhyPjV70S0LPbQRn2ErLmDJKbR4wc3W8VZXFQP5EaHIrYK8qZn-_pp6y7IM4ZtXrjqPcYOpBZ3q36t5a0Psp7to3HxARwy3RSp91snA',
	# 	#   raw_info: {
	# 	#     kind: 'plus#personOpenIdConnect',
	# 	#     gender: 'female',
	# 	#     sub: '102492263388954313581',
	# 	#     name: 'Priscila Queiroz',
	# 	#     given_name: 'Priscila',
	# 	#     family_name: 'Queiroz',
	# 	#     profile: 'https://plus.google.com/+PriscilaQueiroz',
	# 	#     picture: 'https://lh6.googleusercontent.com/-nPD97CqBKlI/AAAAAAAAAAI/AAAAAAAA0fw/0odv_4qWhc0/photo.jpg?sz=50',
	# 	#     email: 'poqueiroz@gmail.com',
	# 	#     email_verified: 'true',
	# 	#     locale: 'pt-BR'
	# 	#   }
	# 	# }
	# }

end
