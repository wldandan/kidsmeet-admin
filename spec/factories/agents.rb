# == Schema Information
#
# Table name: agents
#
#  id                     :integer          not null, primary key
#  username               :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  wechat                 :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_agents_on_email                 (email) UNIQUE
#  index_agents_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :agent do
    username              { 'wldandan' }
    email                 { 'wldandan@gmail.com' }
    wechat                { 'wldandan' }
    password              { '12345678' }
    password_confirmation { '12345678' }

    trait :with_published_event do
      after(:create) do |event|
        create_list(:event, 1, agent: agent)
      end
    end

  end
end

