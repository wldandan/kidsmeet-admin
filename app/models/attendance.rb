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
  belongs_to :event, :inverse_of => :attendances
  belongs_to :user

  validates :username, presence: true
  validates :phone_number, presence: true
  validates :adults_number, presence: true
  validates :children_number, presence: true

  def title
    "#{username}-#{phone_number}"
  end
end
