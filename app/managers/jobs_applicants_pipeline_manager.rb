class JobsApplicantsPipelineManager 
    attr_reader :object

    def initialize(params: nil, object: nil)
      @params = params    if params.present?
      @object = object    if object.present?
    end
  
    def build
      JobsApplicantsPipeline.new
    end
  
    def update
      @object.update({ **object_params, passed: true } )
    end
  
    private
  
    def object_params
      @params.require(:jobs_applicants_pipeline).permit(permitted_params)
    end
  
    def permitted_params
      %i[
        feedback
      ]
    end
end