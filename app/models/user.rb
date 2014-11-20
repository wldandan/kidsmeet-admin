class User < ActiveRecord::Base
  has_many :attendances

  def name
    username
  end
end
