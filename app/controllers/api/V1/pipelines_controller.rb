module Api
  module V1  
    class PipelinesController < ApiController
      before_action :set_pipeline, only: %i[ show update destroy ]

      # GET /pipelines/1
      def show
        json_response(data: PipelineSerializer.new(@pipeline))
      end

      # POST /pipelines
      def create
        pipeline_manager = PipelineManager.new(params: params)
        
        if pipeline_manager.create
          json_response(message: I18n.t(:success, scope: %i[messages create]), data: PipelineSerializer.new(pipeline_manager.object), status: :created)
        else
          json_response(message: I18n.t(:error, scope: %i[messages create]), data: pipeline_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # PATCH/PUT /pipelines/1
      def update
        pipeline_manager = PipelineManager.new(params: params, object: @pipeline)
        
        if pipeline_manager.update
          json_response(message: I18n.t(:success, scope: %i[messages update]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages update]), data: pipeline_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /pipelines/1
      def destroy
        pipeline_manager = PipelineManager.new(object: @pipeline)
        
        if pipeline_manager.destroy
          json_response(message: I18n.t(:success, scope: %i[messages destroy]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages destroy]), data: pipeline_manager.object.errors, status: :unprocessable_entity)
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_pipeline
          @pipeline = Pipeline.find(params[:id])
        end
    end
  end
end