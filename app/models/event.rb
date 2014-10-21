class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :category, type: String
  field :abstract, type: String
  field :content, type: String

  field :main_image_url, type: String

  field :is_published, type: Boolean, default: true
  field :is_expired, type: Boolean, default: false

  embeds_one :restrict
  accepts_nested_attributes_for :restrict

  validates :title, presence: true
  validates :category, presence: true
  validates :abstract, presence: true
  validates :content, presence: true
  validates :main_image_url, presence: true
  validates :restrict, presence: true
end
