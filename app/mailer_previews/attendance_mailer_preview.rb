class AttendanceMailerPreview < ActionMailer::Preview
  def send_email
    AttendanceMailer.send_email(1)
  end

end