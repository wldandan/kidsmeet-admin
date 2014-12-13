class Ckeditor::Picture < Ckeditor::Asset

  belongs_to :agent
  belongs_to :event

  has_attached_file :data,
                            :processors => [:watermark],
                            :url  => "#{CONFIG['image_host']}/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                            :path => ":id/:style_:basename.:extension",
                            :styles => {
                                :thumb => '118x100#',
                                :large => {
                                    :geometry       => "1024>",
                                    :watermark_path => "#{Rails.root}/public/images/km-large-logo.png"
                                },
                                :medium => {
                                    :geometry       => "848x477#",
                                    :watermark_path => "#{Rails.root}/public/images/km-medium-logo.png"
                                },
                                :wechat => {
                                    :geometry       => "700x469#",
                                    :watermark_path => "#{Rails.root}/public/images/km-medium-logo.png"
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