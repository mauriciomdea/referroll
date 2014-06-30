class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :desc, type: String
  field :company, type: String
  field :status, type: String, default: 'OPEN'

  belongs_to :owner, class_name: "User"

  validates_presence_of :title, :owner

  def owned_by?(user)
  	user == owner
  end

end
