FactoryGirl.define do

  factory :user, aliases: [:owner] do
  	name			"Default User"
    email			"default@example.com"
  end

  factory :authentication do
		provider	"linkedin"
  	uid				"01234"
  	user
  end

  factory :job do
	  title		"Intern"
	  desc		"Internship."
	  company	"ACME"
	  owner
  end

end