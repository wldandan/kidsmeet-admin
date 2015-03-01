require 'rails_helper'
require 'email_spec'

RSpec.describe AttendanceMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let (:attendance) { Attendance.first } #Need refractoring: prepare test data

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
