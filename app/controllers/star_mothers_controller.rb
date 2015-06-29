class StarMothersController < ApplicationController
  def index
    @star_mothers = StarMother.all.page params[:page]
  end

  def show
    @star_mother = StarMother.find(params[:id])
  end
end
