class Admin::GreenHousesController < Admin::BaseController

  def index
    @green_houses = GreenHouse.all
  end

  def new
    @green_house = GreenHouse.new
  end

  def create
    @green_house = GreenHouse.create(green_house_params)
    redirect_to admin_green_house_path(@green_house)
  end

  private

  def green_house_params
    params.require(:green_house).permit(:name, :location)
  end
end
