Paperclip::Attachment.default_options[:storage] = :qiniu
Paperclip::Attachment.default_options[:qiniu_credentials] = {
    :access_key => ENV['IMAGE_SERVER_ACCESS_KEY'] || raise("set env QINIU_ACCESS_KEY"),
    :secret_key => ENV['IMAGE_SERVER_SECRET_KEY'] || raise("set env QINIU_SECRET_KEY")
}
Paperclip::Attachment.default_options[:bucket] = CONFIG['qiniu_bucket']
Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Attachment.default_options[:qiniu_host] = "http://#{CONFIG['qiniu_bucket']}.qiniudn.com"
if Rails.env.test?
  Paperclip::Attachment.default_options.merge!({
  :url => "/tmp/:class/:attachment/:id_partition/:style/:filename",
  :path => "/tmp/:id/:style_:basename.:extension" })
end

