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

class Attendance < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end
