class JobsApplicantsController < ApplicationController
  before_action :set_jobs_applicant, only: %i[ show update destroy ]

  # GET /jobs_applicants
  def index
    @jobs_applicants = JobsApplicant.all

    render json: @jobs_applicants
  end

  # GET /jobs_applicants/1
  def show
    render json: @jobs_applicant
  end

  # POST /jobs_applicants
  def create
    @jobs_applicant = JobsApplicant.new({
      job_id: params[:job_id], 
      applicant_id: params[:applicant_id],
      url_token: SecureRandom.hex(10)
    })

    if @jobs_applicant.save
      @job = Job.find(params[:job_id])

      @job.pipelines.map do |pipeline|
        JobsApplicantsPipeline.create({
          jobs_applicant_id: @jobs_applicant.id,
          pipeline_id: pipeline.id 
        })
      end

      render json: @jobs_applicant, status: :created, location: @jobs_applicant
    else
      render json: @jobs_applicant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs_applicants/1
  def update
    if @jobs_applicant.update(jobs_applicant_params)
      render json: @jobs_applicant
    else
      render json: @jobs_applicant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs_applicants/1
  def destroy
    @jobs_applicant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobs_applicant
      @jobs_applicant = JobsApplicant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jobs_applicant_params
      params.fetch(:jobs_applicant, {})
    end
end
