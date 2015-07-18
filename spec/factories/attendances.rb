# == Schema Information
#
# Table name: attendances
#
#  id            :integer          not null, primary key
#  event_id      :integer
#  user_id       :integer
#  phone_number  :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  baby_name     :string(255)
#  baby_age      :integer
#  mother_name   :string(255)
#  wechat_id     :string(255)
#  event_time_id :integer
#

FactoryGirl.define do
  factory :attendance do
    sequence(:mother_name)     { |n| "用户#{n}" }
    sequence(:phone_number) { |n| '%11d' %[n] }
    email                   { Faker::Internet.email }
    adults_number           { 1 }
    children_number         { 1 }

    after(:build) do |attendance|
      attendance.class.skip_callback(:save, :before, :set_user)
      attendance.class.skip_callback(:save, :after,  :notify_consumer)
      attendance.class.skip_callback(:save, :after,  :notify_agent)
    end
  end
end
