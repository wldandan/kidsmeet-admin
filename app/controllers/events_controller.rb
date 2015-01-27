class EventsController < ApplicationController
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

  # GET /events/1
  # GET /events/1.json
  def show
    #require 'byebug'; debugger
    @attendance = Attendance.new

    respond_to do |format|
      format.html
      format.xls {response.headers['Content-Disposition'] = "attachment; filename=\"#{@event.title}.xls\"" }
      format.json { render :show, status: :created, location: @event }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :category,:contact_phone, :abstract, :content)
  end


end
