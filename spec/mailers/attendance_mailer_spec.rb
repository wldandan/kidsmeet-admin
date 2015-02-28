require 'rails_helper'

RSpec.describe AttendanceMailer do
  shared_examples_for 'send email by sidekiq' do
    let (:sidekiq_jobs) { Sidekiq::Extensions::DelayedMailer.jobs }

    it 'add job to sidekiq queue' do
      expect {subject}.to change(sidekiq_jobs, :size).by(1)
    end
  end

  describe '#send_email_to_agent' do
    subject { AttendanceMailer.delay_for(5.second).send_email_to_agent(1) }
    it_behaves_like 'send email by sidekiq'
  end

  describe '#send_email_to_consumer' do
    subject { AttendanceMailer.delay_for(5.second).send_email_to_agent(1) }
    it_behaves_like 'send email by sidekiq'
  end
end
