class Event
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :title, type: String
  field :category, type: String
  field :abstract, type: String
  field :content, type: String
  field :main_image_url, type: String
  field :post_url, type: String
  field :apply_end_date, type: Date
  field :apply_number_limitation, type: Integer
end
