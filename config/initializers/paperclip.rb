Paperclip::Attachment.default_options[:storage] = :qiniu
Paperclip::Attachment.default_options[:qiniu_credentials] = {
    :access_key => 'ILnluZ-YQrljLoKF0nXEmT_-cMDvcALV4HKeWJkE' || raise("set env QINIU_ACCESS_KEY"),
    :secret_key => 'Oms5SyDX4K8oE6SE9d29TuymCv2WXNwJcCd33B56' || raise("set env QINIU_SECRET_KEY")
}
Paperclip::Attachment.default_options[:bucket] = 'kidmeets-images'
Paperclip::Attachment.default_options[:use_timestamp] = false
Paperclip::Attachment.default_options[:qiniu_host] = 'http://kidmeets-images.qiniudn.com'