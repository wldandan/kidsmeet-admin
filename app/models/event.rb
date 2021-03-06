# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  agent_id        :integer
#  title           :string(255)
#  category        :string(255)
#  abstract        :text
#  content         :text
#  valuable_items  :text
#  main_image_url  :string(255)
#  start_time      :datetime
#  end_time        :datetime
#  contact_phone   :string(255)
#  address         :string(255)
#  is_published    :boolean          default(TRUE)
#  created_at      :datetime
#  updated_at      :datetime
#  golden_data_url :string(255)
#  star_mother_id  :integer
#  goden_data_url  :string(255)
#
# Indexes
#
#  index_events_on_contact_phone  (contact_phone)
#  index_events_on_title          (title)
#

class Event < ActiveRecord::Base

  belongs_to :agent
  belongs_to :star_mother
  has_many :pictures, class_name: "Ckeditor::Picture", autosave: true
  accepts_nested_attributes_for :pictures, allow_destroy: true

  has_many :attendances, inverse_of: :event
  accepts_nested_attributes_for :attendances, allow_destroy: true

  has_many :event_times, inverse_of: :event
  accepts_nested_attributes_for :event_times, allow_destroy: true

  #validates :agent, presence: true
  validates :title, presence: true
  validates :category, presence: true
  validates :abstract, presence: true
  validates :content, presence: true
  validates :valuable_items, presence: true
  validates :pictures, presence: true

  scope :upcommings, ->(time) { where("end_time >= ?", time).order('created_at DESC') }
  scope :histories,  ->(time) { where("end_time < ?",  time).order('created_at DESC') }


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
    main_image.try(:data).try(:url, :large)
  end

  def brand_image_url
    main_image.try(:data).try(:url, :medium)
  end

  def main_image
    pictures.first
  end

  def main_image_thumb_url
    "#{CONFIG['image_server']}/#{main_image.id}/thumb_#{main_image.data_file_name}"
  end

  def brand_thumb_url
    "#{CONFIG['image_server']}/#{main_image.id}/thumb_#{main_image.data_file_name}"
  end

  def duration
    end_time - start_time
  end

  def as_json(options = { })
    json = super(options)
    json[:url] = "#{CONFIG['domain_name']}/events/#{id}"
    json[:main_image_url] = brand_image_url
    json
  end

  def valuable_items_array
    valuable_items ? valuable_items.split("\r\n").inject([]) { |result, element| result << element } : []
  end

end
