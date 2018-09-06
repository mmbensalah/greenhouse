class Admin::PlantsController < Admin::BaseController

  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
    @green_houses = GreenHouse.all
  end

  def create
    @plant = Plant.create(plant_params)
    @green_house = GreenHouse.find(plant_params[:green_house_id])
    redirect_to plant_path(@plant)
  end

  def destroy
    @plant = Plant.find(params[:id])
    if @plant.destroy
      flash[:success] = "#{@plant.name} deleted."
    end
    redirect_to plants_path
  end

  def edit
    @plant = Plant.find(params[:id])
    @green_houses = GreenHouse.all
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    if @plant.save
      flash[:success] = "#{@plant.name} updated!"
      redirect_to plant_path(@plant)
    else
      render :edit
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :variety, :sell_quantity,
                                  :stock_plants, :zone, :shipping, :green_house_id)
  end
end
