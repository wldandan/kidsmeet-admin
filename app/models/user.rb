# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  username     :string(255)
#  email        :string(255)
#  phone_number :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_username  (username)
#

class User < ActiveRecord::Base
  has_many :attendances

  def name
    username
  end
end
