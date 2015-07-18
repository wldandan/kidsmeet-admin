# == Schema Information
#
# Table name: event_times
#
#  id           :integer          not null, primary key
#  time         :string(255)
#  number_limit :integer
#  event_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class EventTime < ActiveRecord::Base
  belongs_to :event
end
