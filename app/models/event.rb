class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title,     type: String
  field :category,  type: String
  field :abstract,  type: String
  field :address,   type: String
  field :duration,  type:String
  field :content,   type: String


  field :main_image_url,    type: String
  field :expired_at,        type: DateTime
  field :is_published,      type: Boolean, default: true

  embeds_one :restrict
  accepts_nested_attributes_for :restrict

  validates :title, presence: true
  validates :category, presence: true
  validates :abstract, presence: true
  validates :content, presence: true
  validates :main_image_url, presence: true
  validates :expired_at, presence: true
  validates :address, presence: true
  validates :duration, presence: true
  validates :restrict, presence: true
end
