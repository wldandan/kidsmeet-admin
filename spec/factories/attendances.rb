# == Schema Information
#
# Table name: attendances
#
#  id              :integer          not null, primary key
#  event_id        :integer
#  user_id         :integer
#  children_number :integer
#  adults_number   :integer
#  username        :string(255)
#  phone_number    :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

FactoryGirl.define do
  factory :attendance do
    sequence(:username)     { |n| "用户#{n}" }
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
