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

  before_save :set_user

  after_save  :notify_consumer,  :on => :create
  after_save  :notify_agent,     :on => :create

  belongs_to :event,            :inverse_of => :attendances
  belongs_to :user

  validates :username,          presence: true
  validates :phone_number,      presence: true
  validates :adults_number,     presence: true
  validates :children_number,   presence: true

  def title
    "#{username}-#{phone_number}"
  end

  private

  def set_user
    byebug
    user = User.find_by_phone_number(phone_number)
    user = create_user_by_attendance if user.blank?
    self.user = user
  end

  def create_user_by_attendance
    user = User.new({ username:     username,
                      email:        email,
                      phone_number: phone_number })
    user.save
    user
  end

  def notify_consumer
    AttendanceMailer.delay_for(5.second).send_email_to_consumer(id)
  end

  def notify_agent
    AttendanceMailer.delay_for(5.second).send_email_to_agent(id)
  end

end
