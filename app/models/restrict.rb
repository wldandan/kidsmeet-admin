class Restrict
  include Mongoid::Document

  field :apply_end_date, type: Date
  field :apply_max_number, type: Integer

  validates :apply_end_date, presence: true
  embedded_in :event
end