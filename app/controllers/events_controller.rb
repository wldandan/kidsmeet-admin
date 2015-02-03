class EventsController < ApplicationController
  skip_before_action :authenticate_agent!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def upcomings
    @events = Event.upcommings(Time.now).page params[:page]
    @menu_item = 'upcomings'
  end

  def history
    @events = Event.histories(Time.now).page params[:page]
    @menu_item = 'history'
    render :template => "events/upcomings", :events => @events
  end

  def show
    @attendance = Attendance.new
    respond_to do |format|
      format.html
      format.xls {response.headers['Content-Disposition'] = "attachment; filename=\"#{@event.title}.xls\"" }
      format.json { render :show, status: :created, location: @event }
    end
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end
end
