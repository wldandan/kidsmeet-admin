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

FactoryGirl.define do
  factory :event_time do
    
  end

end
