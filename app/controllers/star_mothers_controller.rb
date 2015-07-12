class StarMothersController < ApplicationController
  skip_before_action :authenticate_agent!

  def index
    @menu_item = 'star_mothers'
    @star_mothers = StarMother.all.page params[:page]
  end

  def show
    @menu_item = 'star_mothers'
    @star_mother = StarMother.find(params[:id])
    @events = Event.first(5)
  end
end
