require 'rails_helper'
require 'email_spec'

RSpec.describe AttendanceMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let (:attendance) { Attendance.first } #Need refractoring: prepare test data

  describe 'sending email job been added to sidekiq queue' do
    shared_examples_for 'send email by sidekiq' do
      let (:sidekiq_jobs) { Sidekiq::Extensions::DelayedMailer.jobs }

      it 'add job to sidekiq queue' do
        expect {subject}.to change(sidekiq_jobs, :size).by(1)
      end
    end

    describe '#send_email_to_agent' do
      subject { AttendanceMailer.delay_for(5.second).send_email_to_agent(attendance.try(:id)) }
      it_behaves_like 'send email by sidekiq'
    end

    describe '#send_email_to_consumer' do
      subject { AttendanceMailer.delay_for(5.second).send_email_to_consumer(attendance.try(:id)) }
      it_behaves_like 'send email by sidekiq'
    end
  end

  describe 'send_email_to_agent' do
    it 'should deliver email to agent' do
      email = AttendanceMailer.send_email_to_agent(attendance.try(:id)).deliver
      expect(email).to deliver_to(attendance.event.agent.email)
      expect(email).to have_subject("恭喜您，有#{attendance.adults_number + attendance.children_number}位新朋友加入您组织的活动")
    end

    it 'should deliver email to consumer' do
      email = AttendanceMailer.send_email_to_consumer(attendance.try(:id)).deliver
      expect(email).to deliver_to(attendance.email)
      expect(email).to have_subject("感谢您的关注 [#{attendance.event.title}]")
    end
  end

end
