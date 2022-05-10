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
        @applicant = Applicant.new(applicant_params)

        if @applicant.save
          render json: @applicant, status: :created
        else
          render json: @applicant.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /applicants/1
      def update
        if @applicant.update(applicant_params)
          render json: @applicant
        else
          render json: @applicant.errors, status: :unprocessable_entity
        end
      end

      # DELETE /applicants/1
      def destroy
        @applicant.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_applicant
          @applicant = Applicant.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def applicant_params
          params.require(:applicant).permit(:first_name, :last_name, :email)
        end
    end
  end
end