class User
  include Mongoid::Document
  include Mongoid::Timestamps
  

  field :name, type: String
  field :desc, type: String
  field :email, type: String
  field :avatar, type: String
  field :url, type: String

  has_many :authentications

  validates_uniqueness_of :email

  def self.from_omniauth(auth)

  	user = find_with_omniauth(auth)
  	unless user	# New User
  			user = create_from_omniauth(auth)
  	end

		unless Authentication.find_with_omniauth(auth) # New Authentication
			user.authentications << Authentication.create_with_omniauth(auth)
			user.save
		end

		return user

	end

	def self.find_with_omniauth(auth)
  	where(email: auth["info"]["email"]).first
  end

	def self.create_from_omniauth(auth)
	  user = User.new
	  user.name = auth["info"]["name"]
    user.email = auth["info"]["email"]
    user.desc = auth["info"]["description"]
    user.avatar = auth["info"]["image"]
    # user.authentications << Authentication.create_with_omniauth(auth)
    user.save!
	  return user
	end

end