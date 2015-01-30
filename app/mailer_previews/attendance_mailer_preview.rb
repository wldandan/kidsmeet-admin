class AttendanceMailerPreview < ActionMailer::Preview
  def send_email
    AttendanceMailer.send_email_to_consumers(1)
  end

end