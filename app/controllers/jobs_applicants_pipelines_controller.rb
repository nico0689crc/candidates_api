class JobsApplicantsPipelinesController < ApplicationController
  before_action :set_jobs_applicants_pipeline, only: %i[ show update destroy ]

  # GET /jobs_applicants_pipelines
  def index
    @jobs_applicants_pipelines = JobsApplicantsPipeline.all

    render json: @jobs_applicants_pipelines
  end

  # GET /jobs_applicants_pipelines/1
  def show
    render json: @jobs_applicants_pipeline
  end

  # POST /jobs_applicants_pipelines
  def create
    @jobs_applicants_pipeline = JobsApplicantsPipeline.new(jobs_applicants_pipeline_params)

    if @jobs_applicants_pipeline.save
      render json: @jobs_applicants_pipeline, status: :created, location: @jobs_applicants_pipeline
    else
      render json: @jobs_applicants_pipeline.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs_applicants_pipelines/1
  def update
    if @jobs_applicants_pipeline.update(jobs_applicants_pipeline_params)
      render json: @jobs_applicants_pipeline
    else
      render json: @jobs_applicants_pipeline.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs_applicants_pipelines/1
  def destroy
    @jobs_applicants_pipeline.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobs_applicants_pipeline
      @jobs_applicants_pipeline = JobsApplicantsPipeline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jobs_applicants_pipeline_params
      params.require(:jobs_applicants_pipeline).permit(:jobs_applicant_id, :pipeline_id, :passed)
    end
end
