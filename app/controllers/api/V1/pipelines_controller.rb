module Api
  module V1  
    class PipelinesController < ApiController
      before_action :set_pipeline, only: %i[ show update destroy ]

      # GET /pipelines
      def index
        @pipelines = Pipeline.all

        render json: @pipelines
      end

      # GET /pipelines/1
      def show
        render json: @pipeline
      end

      # POST /pipelines
      def create
        @pipeline = Pipeline.new(pipeline_params)

        if @pipeline.save
          render json: @pipeline, status: :created
        else
          render json: @pipeline.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /pipelines/1
      def update
        if @pipeline.update(pipeline_params)
          render json: @pipeline
        else
          render json: @pipeline.errors, status: :unprocessable_entity
        end
      end

      # DELETE /pipelines/1
      def destroy
        @pipeline.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_pipeline
          @pipeline = Pipeline.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def pipeline_params
          params.require(:pipeline).permit(:title, :description, :order, :job_id, :attendant_id)
        end
    end
  end
end