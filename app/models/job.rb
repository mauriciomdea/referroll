class Job
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Enumerize

  field :title, type: String
  field :desc, type: String
  field :company, type: String
  field :status, type: String

  enumerize :status, in: { open: 1, closed: 0 }, default: :open, predicates: true

  belongs_to :owner, class_name: "User"

  validates_presence_of :title, :owner

  def owned_by?(user)
  	user == owner
  end

end
