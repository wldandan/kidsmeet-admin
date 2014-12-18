# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  agent_id       :integer
#  title          :string(255)
#  category       :string(255)
#  abstract       :string(255)
#  content        :text
#  main_image_url :string(255)
#  start_time     :datetime
#  end_time       :datetime
#  contact_phone  :string(255)
#  address        :string(255)
#  is_published   :boolean          default(TRUE)
#  created_at     :datetime
#  updated_at     :datetime
#
# Indexes
#
#  index_events_on_contact_phone  (contact_phone)
#  index_events_on_title          (title)
#

class Event < ActiveRecord::Base

  belongs_to :agent
  has_many :assets, :class_name=> "Ckeditor::Picture", :autosave => true
  accepts_nested_attributes_for :assets, :allow_destroy => true

  has_many :attendances, :dependent => :destroy, :inverse_of => :event
  accepts_nested_attributes_for :attendances, :allow_destroy => true

  validates :agent, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :abstract, presence: true
  validates :content, presence: true
  validates :main_image_url, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  validates :assets, presence: true

  def adults_number
    attendances.inject(0) { |result, item|
      result + item.adults_number
    }
  end

  def children_number
    attendances.inject(0) { |result, item|
      result + item.children_number
    }
  end

  def is_expired?
    end_time < Time.new
  end

  def detail_image_url
    main_image_url.gsub('medium','large')
  end

  def mail_image_url
    main_image_url.gsub('medium','wechat')
  end

  def main_image
    assets.first
  end

  def main_image_thumb_url
    unless main_image.blank?
      "#{CONFIG['image_server']}/#{main_image.id}/thumb_#{main_image.data_file_name}"
    end
  end

  def users
    #User.in(id: attendances.map(&:user_id))
  end

  def duration
    end_time - start_time
  end

end
