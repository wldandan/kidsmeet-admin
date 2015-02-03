class AttendancesController < ApplicationController
  skip_before_action :authenticate_agent!, only: :join
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def join
      @attendance = Attendance.new(attendance_params)
    begin
      raise ArgumentError if params[:attendance][:phone_number].empty? ||
                             params[:attendance][:email].empty? ||
                             params[:attendance][:username].empty?

      AttendanceService.register(params[:attendance][:event_id], @attendance)

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
      params.require(:attendance).permit(:username, :phone_number, :email, :children_number, :adults_number)
    end
end
