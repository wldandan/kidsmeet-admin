# == Schema Information
#
# Table name: star_mothers
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  introduction :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class StarMother < ActiveRecord::Base
  has_many :events
  has_many :pictures, :class_name=> "Ckeditor::Picture", :autosave => true
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
