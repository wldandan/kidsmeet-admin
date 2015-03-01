# == Schema Information
#
# Table name: ckeditor_assets
#
#  id                :integer          not null, primary key
#  agent_id          :integer
#  event_id          :integer
#  data_file_name    :string(255)      not null
#  data_content_type :string(255)
#  data_file_size    :integer
#  assetable_id      :integer
#  assetable_type    :string(30)
#  type              :string(30)
#  width             :integer
#  height            :integer
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  idx_ckeditor_assetable       (assetable_type,assetable_id)
#  idx_ckeditor_assetable_type  (assetable_type,type,assetable_id)
#

class Ckeditor::Picture < Ckeditor::Asset

  belongs_to :agent
  belongs_to :event

  has_attached_file :data,
                    :processors => [:watermark],
                    :styles => {
                        :thumb => '118x100#',
                        :large => {
                            :geometry       => "1024>"
                            #:watermark_path => "#{Rails.root}/public/images/km-large-logo.png"
                        },
                        :medium => {
                            :geometry       => "848x477#"
                            #:watermark_path => "#{Rails.root}/public/images/km-medium-logo.png"
                        },
                        :wechat => {
                            :geometry       => "700x469#"
                            #:watermark_path => "#{Rails.root}/public/images/km-medium-logo.png"
                        }
                    }
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_presence :data

  validates_attachment_content_type :data, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  def title
    data_file_name
  end

  def agent_id
    return assetable_id unless assetable_id.blank?
    return agent.id unless agent.nil? && agent.blank?
    return event.agent.id unless event.nil? && event.agent.nil? && event.agent.blank?
  end
end
