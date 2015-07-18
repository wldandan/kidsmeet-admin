# == Schema Information
#
# Table name: event_times
#
#  id           :integer          not null, primary key
#  number_limit :integer
#  event_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  display_time :string(255)
#  date_time    :datetime
#

class EventTime < ActiveRecord::Base
  belongs_to :event
end
