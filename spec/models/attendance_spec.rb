# == Schema Information
#
# Table name: attendances
#
#  id              :integer          not null, primary key
#  event_id        :integer
#  user_id         :integer
#  children_number :integer
#  adults_number   :integer
#  username        :string(255)
#  phone_number    :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'rails_helper'

RSpec.describe AttendanceMailer do

  let (:attendance) { Attendance.first } #Need refractoring: prepare test data

  describe 'sending email job been added to sidekiq queue' do
    shared_examples_for 'send email by sidekiq' do
      let (:sidekiq_jobs) { Sidekiq::Extensions::DelayedMailer.jobs }

      it 'add job to sidekiq queue' do
        expect {subject}.to change(sidekiq_jobs, :size).by(1)
      end
    end

    describe '#notify_agent' do
      subject { AttendanceMailer.delay_for(5.second).send_email_to_agent(attendance.try(:id)) }
      it_behaves_like 'send email by sidekiq'
    end

    describe '#notify_consumer' do
      subject { AttendanceMailer.delay_for(5.second).send_email_to_consumer(attendance.try(:id)) }
      it_behaves_like 'send email by sidekiq'
    end
  end
end
