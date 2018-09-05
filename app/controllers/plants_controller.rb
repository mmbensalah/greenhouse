class PlantsController < ApplicationController
  def index
    @plants = Plant.ordered_plants
  end

  def show
    @plant = Plant.find(params[:id])
  end
end
