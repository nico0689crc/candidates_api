module Api
  module V1      
    class JobsApplicantsPipelinesController < ApiController
      before_action :set_jobs_applicants_pipeline, only: %i[ update ]

      # PATCH/PUT /jobs_applicants_pipelines/1
      def update
        jobs_applicants_pipeline_manager = JobsApplicantsPipelineManager.new(params: params, object: @jobs_applicants_pipeline)
        
        if jobs_applicants_pipeline_manager.update
          json_response(message: I18n.t(:success, scope: %i[messages update]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages update]), data: attendant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_jobs_applicants_pipeline
          @jobs_applicants_pipeline = JobsApplicantsPipeline.find(params[:id])
        end
    end
  end
end