class StarMothersController < ApplicationController
  skip_before_action :authenticate_agent!

  def index
    @star_mothers = StarMother.all.page params[:page]
  end

  def show
    @star_mother = StarMother.find(params[:id])
  end
end
