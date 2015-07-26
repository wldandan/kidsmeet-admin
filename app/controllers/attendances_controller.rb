class AttendancesController < ApplicationController
  skip_before_action :authenticate_agent!, only: :join
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def join
    @attendance = Attendance.create(attendance_params)

    golden_data_url = Event.find(attendance_params['event_id']).golden_data_url
    GodenDataService.get_form(golden_data_url)
    GodenDataService.post_data(golden_data_url, attendance_params.except('event_id'))

    begin
      respond_to do |format|
        format.html { redirect_to @attendance.event, notice: '感谢您的关注，我们已收到您的报名信息，将尽快联系您！' }
        format.json { render :show, status: :created, location: attendance_event }
      end
    rescue Exception => e
      logger.fatal e
      respond_to do |format|
        format.html { redirect_to @attendance.event }
      end
      return
    end
  end

  private
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(:event_id, :baby_name, :baby_age, :mother_name, :phone_number, :wechat_id, :event_time_id)
    end
end
