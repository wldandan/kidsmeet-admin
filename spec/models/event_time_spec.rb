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

require 'rails_helper'

RSpec.describe EventTime, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
