class AgentsController < ApplicationController
  before_action :set_agent, only: [:histories, :upcomings]

  def histories
    @events = Event.where("end_time < ? AND agent_id = ?", Time.new, @agent.id).limit(5).order('id asc')
    respond_with_events(@events)
  end

  def upcomings
    @events = Event.where("end_time > ? AND agent_id = ?", Time.new, @agent.id).limit(5).order('id asc')
    respond_with_events(@events)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_agent
    @agent = Agent.find_by_wechat(params[:wechat])
  end

  def respond_with_events(events)
    respond_to do |format|
      format.json { render :json => {
          :agent => @agent.as_json,
          :events => events.as_json(:except => [:content, :agent_id])
        }
      }
    end
  end

end
