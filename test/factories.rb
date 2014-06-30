FactoryGirl.define do

  factory :user, aliases: [:owner] do
  	# name			"Default User"
  	# email			"default@example.com"
  	sequence(:name) { |n| "User #{n}" }
  	email { "#{name.parameterize}@example.com" }
  end

  factory :authentication do
		provider	"linkedin"
  	uid				{ |n| "#{n}" }
  	user
  end

  factory :job do
	  title		"Intern"
	  desc		"Internship."
	  company	"ACME"
	  owner
  end

end