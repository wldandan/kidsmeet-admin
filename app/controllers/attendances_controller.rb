class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # POST /attendances
  # POST /attendances.json
  def join
      @attendance = Attendance.new(attendance_params)

    begin

      raise ArgumentError if params[:attendance][:phone_number].empty? ||
                             params[:attendance][:email].empty? ||
                             params[:attendance][:username].empty?

      user =  attendance_user
      event = attendance_event

      respond_to do |format|
        #require 'byebug';debugger
        @attendance.user = user
        @attendance.event = event
        if @attendance.save
            AttendanceMailer.delay_for(5.second).send_email_to_consumers(@attendance.id)
            AttendanceMailer.delay_for(5.second).send_email_to_agents(@attendance.id)
          format.html { redirect_to attendance_event, notice: '感谢您的关注，我们已收到您的报名信息，将尽快联系您！' }
          format.json { render :show, status: :created, location: attendance_event }
        else
          format.html { render :new }
          format.json { render json: @attendance.errors, status: :unprocessable_entity }
        end
      end
    rescue Exception => e
      #Log the error
      logger.fatal e
      respond_to do |format|
        format.html { redirect_to attendance_event }
      end
      return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:username, :phone_number, :email, :children_number, :adults_number)
    end

    def attendance_user
      user = User.find_by(:phone_number => params[:attendance][:phone_number])
      if user.nil?
        user = User.new({:username=>params[:attendance][:username],
                         :email => params[:attendance][:email],
                         :phone_number => params[:attendance][:phone_number]})
        user.save
      end
      user
    end

    def attendance_event
      Event.find(params[:attendance][:event_id])
    end
end
