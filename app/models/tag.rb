class Tag
  include Mongoid::Document

  belongs_to :item

  field :title, type: String
  validates :title, presence: true, uniqueness: true
end
