class Admin::PlantsController < Admin::BaseController
  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.create(plant_params)
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :variety, :sell_quantity,
                                  :stock_plants, :zone, :shipping)
  end
end
