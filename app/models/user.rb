class User
  include Mongoid::Document

  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :desc, type: String
  field :email, type: String
  field :avatar, type: String
  field :url, type: String

  def self.from_omniauth(auth)
	  where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	    user.email = auth["info"]["email"]
	    user.desc = auth["info"]["description"]
	    user.avatar = auth["info"]["image"]
	    user.url = auth["info"]["urls"]["public_profile"]
	  end
	end

end