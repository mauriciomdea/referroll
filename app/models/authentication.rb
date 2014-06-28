class Authentication
  include Mongoid::Document

  field :user_id, type: String
  field :provider, type: String
  field :uid, type: String

  belongs_to :user

  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, scope: :provider

  def self.find_or_create_with_omniauth(auth)
  	find_with_omniauth(auth) || create_with_omniauth(auth)
  end

  def self.find_with_omniauth(auth)
    find_by provider: auth['provider'], uid: auth['uid']
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'])
  end

end
