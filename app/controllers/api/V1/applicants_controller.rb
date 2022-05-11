module Api
  module V1      
    class ApplicantsController < ApiController
      before_action :set_applicant, only: %i[ show update destroy ]

      # GET /applicants
      def index
        @presenter = ApplicantsPresenter.new(params)
        json_response(data: ActiveModel::Serializer::CollectionSerializer.new( @presenter.applicants, serializer: ApplicantSerializer))
      end

      # GET /applicants/1
      def show
        json_response(data: ApplicantSerializer.new(@applicant))
      end

      # POST /applicants
      def create
        applicant_manager = ApplicantManager.new(params: params)
        
        if applicant_manager.create
          json_response(message: I18n.t(:success, scope: %i[messages create]), data: ApplicantSerializer.new(applicant_manager.object), status: :created)
        else
          json_response(message: I18n.t(:error, scope: %i[messages create]), data: applicant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # PATCH/PUT /applicants/1
      def update
        applicant_manager = ApplicantManager.new(params: params, object: @applicant)
        
        if applicant_manager.update
          json_response(message: I18n.t(:success, scope: %i[messages update]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages update]), data: applicant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /applicants/1
      def destroy
        applicant_manager = JobManager.new(object: @applicant)
        
        if applicant_manager.destroy
          json_response(message: I18n.t(:success, scope: %i[messages destroy]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages destroy]), data: applicant_manager.object.errors, status: :unprocessable_entity)
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_applicant
          @applicant = Applicant.find(params[:id])
        end
    end
  end
end