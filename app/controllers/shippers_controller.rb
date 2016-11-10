class ShippersController < ApplicationController
  before_action :shipper, except: [:new, :create, :index]

  def index
  flash[:success] = "You have been signed in"
  @jobs = current_shipper.jobs
  end

  def edit

  end

  def update
    @shipper = Shipper.find(params[:id])
    if @shipper.update(shipper_params)
      redirect_to shipper_edit_path
    else
      render :edit
    end
  end

  private

    def shipper_params
      params.require(:shipper).permit(:jobs, :addresses)
    end

    def shipper
      @shipper = Shipper.find(params[:id])
    end

    def job
      @job = Shipper.job.find(params[:id])
    end

    def address
      @address = Shipper.job.address.find(params[:id])
    end

end
