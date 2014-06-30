class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  def index
    @jobs = Job.all
  end

  # GET /jobs/1
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)
    @job.owner = current_user

    if @job.save
      redirect_to @job, notice: t('notices.create', model: t('models.job.one'))
    else
      render :new
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      redirect_to @job, notice: t('notices.update', model: t('models.job.one'))
    else
      render :edit
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    redirect_to jobs_url, notice: t('notices.destroy', model: t('models.job.one'))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:title, :desc, :company, :status, :owner)
    end
end
