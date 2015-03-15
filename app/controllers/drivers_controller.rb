class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end
  def new
  	@driver = Driver.new
    @driver.build_license
  end

  def create
  	#render text: params.hash
  	@driver = Driver.new(driver_params)
  	if @driver.save
  		redirect_to @driver
  	else
        render 'new'
  	end
  end
  
  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.update(driver_params)
    if @driver.save
      redirect_to @driver
    else
       render 'edit'
    end

  end
  
  private
  def driver_params
  	params.require(:driver).permit(:fname, :lname, license_attributes: [:number, :state])
  end
end
