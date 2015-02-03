class AttendanceMailerPreview < ActionMailer::Preview
  def send_email
    AttendanceMailer.send_email_to_consumer(1)
  end

end
