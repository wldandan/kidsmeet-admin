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

require 'rails_helper'

RSpec.describe EventTime, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
