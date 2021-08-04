class Item
  include Mongoid::Document

  field :title, type: String
  field :status, type: String
  field :created_at, type: Time
  field :deleted_at, type: Time
end
