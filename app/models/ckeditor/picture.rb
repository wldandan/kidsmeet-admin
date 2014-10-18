class Ckeditor::Picture < Ckeditor::Asset
  has_mongoid_attached_file :data,
                            :processors => [:watermark],
                            :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                            :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                            :styles => {
                                :content => "800>",
                                :thumb => '118x100#',
                                :original => {
                                    :geometry       => "800>",
                                    :watermark_path => "#{Rails.root}/public/images/rea-logo-v3.png"
                                },
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
