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

  def show
    @green_house = GreenHouse.find(params[:id])
  end

  def edit
    @green_house = GreenHouse.find(params[:id])
  end

  def update
    @green_house = GreenHouse.find(params[:id])
    @green_house.update(green_house_params)
    if @green_house.save
      flash[:success] = "#{@green_house.name} updated!"
      redirect_to admin_green_house_path(@green_house)
    else
      render :edit
    end
  end

  def destroy
    @green_house = GreenHouse.find(params[:id])
    if @green_house.destroy
      flash[:success] = "#{@green_house.name} deleted."
    end
    redirect_to admin_green_houses_path
  end

  private

  def green_house_params
    params.require(:green_house).permit(:name, :location)
  end
end
