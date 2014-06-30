FactoryGirl.define do

  factory :user, aliases: [:owner] do
  	sequence(:name) { |n| "User #{n}" }
  	email { "#{name.parameterize}@example.com" }
    # authentication
  end

  factory :authentication do
		provider	     "linkedin"
  	sequence(:uid) { |n| "#{n}" }
    user
  end

  factory :job do
	  title    "Intern"
	  desc     "Internship."
	  company  "ACME"
	  owner    { create(:authentication).user }
  end

end