class AttendanceService

  def self.register(event_id, attendance)
    event = Event.find(event_id)
    attendance.event = event
    attendance.save
  end
end
