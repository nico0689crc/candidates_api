module Api
  module V1      
    class JobsApplicantsController < ApiController
      before_action :set_jobs_applicant, only: %i[ show destroy ]

      # GET /jobs_applicants/1
      def show
        json_response(data: JobsApplicantSerializer.new(@jobs_applicant))
      end

      # POST /jobs_applicants
      def create
        jobs_applicant_manager = JobsApplicantManager.new(params: params)
        
        if jobs_applicant_manager.create
          json_response(message: I18n.t(:success, scope: %i[messages create]), data: JobsApplicantSerializer.new(jobs_applicant_manager.object), status: :created)
        else
          json_response(message: I18n.t(:error, scope: %i[messages create]), data: jobs_applicant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /jobs_applicants/1
      def destroy
        jobs_applicant_manager = JobsApplicantManager.new(object: @jobs_applicant)
        
        if jobs_applicant_manager.destroy
          json_response(message: I18n.t(:success, scope: %i[messages destroy]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages destroy]), data: jobs_applicant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_jobs_applicant
          @jobs_applicant = JobsApplicant.find(params[:id])
        end
    end
  end
end