class Ckeditor::Picture < Ckeditor::Asset
  has_mongoid_attached_file :data,
                            :processors => [:watermark],
                            :url  => "#{CONFIG['image_host']}/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                            :path => ":id/:style_:basename.:extension",
                            :styles => {
                                :large => {
                                    :geometry       => "1024x768#",
                                    :watermark_path => "#{Rails.root}/public/images/km-logo.png"
                                },
                                :content => {
                                    :geometry       => "1024x768#",
                                    :watermark_path => "#{Rails.root}/public/images/km-logo.png"
                                },
                                :medium => {
                                    :geometry       => "700x469#",
                                    :watermark_path => "#{Rails.root}/public/images/km-logo.png"
                                },
                                :original => {
                                    :watermark_path => "#{Rails.root}/public/images/km-logo.png"
                                }
                            }
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_presence :data
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def image_content_type
  end

  def url_content
    url(:content)
  end
end
