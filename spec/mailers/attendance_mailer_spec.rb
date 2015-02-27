require 'rails_helper'

RSpec.describe AttendanceMailer do

  it 'should send email to agent' do
    expect { AttendanceMailer.delay_for(5.second).send_email_to_agent(1) }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
  end

  it 'should send email to consumer' do
    expect { AttendanceMailer.delay_for(5.second).send_email_to_consumer(1) }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
  end

end
