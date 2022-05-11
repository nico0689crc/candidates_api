class PipelineManager 
    attr_reader :object

    def initialize(params: nil, object: nil)
      @params = params    if params.present?
      @object = object    if object.present?
    end
  
    def build
      Pipeline.new
    end
  
    def create
      pipeline_count = Pipeline.where(job_id: @params[:job_id]).count
      @object = Pipeline.new({ **object_params, order: pipeline_count + 1 })
      @object.save
    end
  
    def update
      @object.update(object_params)
    end
  
    def destroy
      @object.destroy
    end
  
    private
  
    def object_params
      @params.require(:pipeline).permit(permitted_params)
    end
  
    def permitted_params
      %i[
        title
        description
        job_id
        attendant_id
      ]
    end
end