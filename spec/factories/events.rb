# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  agent_id       :integer
#  title          :string(255)
#  category       :string(255)
#  abstract       :text
#  content        :text
#  valuable_items :text
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

FactoryGirl.define do |event|
  factory :event do
    title            { '小小橡皮泥——人气爆棚再加场' }
    category         { '亲子活动' }
    abstract         { '第一场活动报名太火爆了，很多家庭没报上，尽请关注' }
    content          { '到白垩纪搭个帐篷，在恐龙护卫下开心滴觉觉吧！帐篷睡具可以自带，没带也不要紧，我们已经为你们准备好啦！' }
    valuable_items   { '丰富学生的课余生活\r\n培养学生的动手能力和创造能力'}
    start_time       { Time.now }
    end_time         { Time.now + 100 }
  end
end
