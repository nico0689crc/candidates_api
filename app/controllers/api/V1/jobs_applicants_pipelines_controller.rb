module Api
  module V1      
    class JobsApplicantsPipelinesController < ApiController
      before_action :set_jobs_applicants_pipeline, only: %i[ update destroy ]

      # PATCH/PUT /jobs_applicants_pipelines/1
      def update
        @jobs_applicants_pipelines_to_update = JobsApplicantsPipeline.where(jobs_applicant_id: @jobs_applicants_pipeline.jobs_applicant_id, passed: false).take
      
        if @jobs_applicants_pipelines_to_update.update(passed: true, feedback: params[:feedback])
          render json: @jobs_applicants_pipelines_to_update
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
  end
end