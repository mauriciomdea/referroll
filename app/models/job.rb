class Job
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :desc, type: String
  field :company, type: String
  field :status, type: String
  # field :owner, type: User

  belongs_to :owner, :class_name => "User"

  def owned_by?(user)
  	user == owner
  end

end
