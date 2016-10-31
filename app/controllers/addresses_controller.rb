class AddressesController < ApplicationController
  before_action :job, only: [:destoy, :edit, :update]
  before_action :address, only: [destroy, :edit, :update]

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to jobs_path(@job, @address)
    else
      render :edit
    end
  end

  def new
    @job = Job.find(params[:job_id])
    @address = Address.new
  end

  def create
    @job = Job.find(params[:job_id])
    @address = @job.addresses.new(address_params)

    if @address.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to job_path(@job)
  end

  private

    def address_params
      params.require(:address).permit(:Country, :Province, :District, :SubDistrict, :StreetAddress, :PostalCode)
    end

    def job
      @job = Job.find(params[:job_id])
    end

    def address
      @address = @job.addresses.find(params[:id])
    end

end
