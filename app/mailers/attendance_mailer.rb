class AttendanceMailer < ActionMailer::Base

  default from: "no-reply@kidsmeet.cn"

  def send_email_to_consumer(attendance_id)
    set_email_configurations(attendance_id)
    mail(:to => @attendance.email,
         :bcc => [],
         :subject => "感谢您的关注 [#{@attendance.event.title}]",
         :template_path => "attendance_mailer",
         :template_name => "email_to_consumer");
  end

  def send_email_to_agent(attendance_id)
    set_email_configurations(attendance_id)
    mail(:to => @attendance.event.agent.email,
         :bcc => [],
         :subject => "恭喜您，有#{@attendance.adults_number + @attendance.children_number}位新朋友加入您组织的活动",
         :template_path => "attendance_mailer",
         :template_name => "email_to_agent");
  end

  private

  def set_email_configurations(attendance_id)
    @attendance = Attendance.find(attendance_id)
    @email_info = {:logo => "#{CONFIG['email_image_host']}/assets/email/logo_with_brand.png"}
  end

end
