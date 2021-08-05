class Item
  include Mongoid::Document

  ITEM_STATUS = ['start', 'not start', 'finish'].freeze

  field :title, type: String
  field :status, type: String
  field :created_at, type: Time
  field :is_deleted, type: Boolean

  # Validations
  validates_presence_of :title, :status
  validates_uniqueness_of :title
  validate :item_status

  private
  def item_status
    error.add(:status, 'Status must be start, not start or finish') unless ITEM_STATUS.include?(status)
  end
end
