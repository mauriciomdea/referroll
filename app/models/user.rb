class User
  include Mongoid::Document

  field :name, type: String
  field :desc, type: String
  field :email, type: String
  field :avatar, type: String
  field :url, type: String

  has_many :authentications

  validates_uniqueness_of :email

  def self.from_omniauth(auth)
	  # where(auth.slice("provider", "uid")).first || where(email: auth["info"]["email"]).first || create_from_omniauth(auth)
	  where(email: auth["info"]["email"]).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
	  user = User.new
	  user.name = auth["info"]["name"]
    user.email = auth["info"]["email"]
    user.desc = auth["info"]["description"]
    user.avatar = auth["info"]["image"]
    # user.url = auth["info"]["urls"]["public_profile"]
    user.save!
	  user.authentications.create(uid: auth['uid'], provider: auth['provider'])
	end

end