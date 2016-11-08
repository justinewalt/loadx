class JobsController < ApplicationController
  before_action :job, except: [:new, :create, :index]

  def index
  flash[:success] = "You have been signed in"
  @jobs = current_shipper.jobs
  end

  def new
    @job = current_shipper.jobs.new
  end

  def create
    @job = current_shipper.jobs.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
  	@addresses = @jobs = Job.all.order('created_at ASC')
  end

  def edit

  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

    def job_params
      params.require(:job).permit(:pickup_date, :delivery_date, :addresses)
    end

    def job
      @job = Job.find(params[:id])
    end
end
