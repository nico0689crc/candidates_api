class JobsApplicantManager 
    attr_reader :object

    def initialize(params: nil, object: nil)
      @params = params    if params.present?
      @object = object    if object.present?
    end
  
    def build
      JobsApplicant.new
    end
  
    def create
      @object = JobsApplicant.new({ **object_params, url_token: SecureRandom.hex(10) })
      
      if @object.save
          @object.job.pipelines.map do |pipeline|
            JobsApplicantsPipeline.create({
              jobs_applicant_id: @object.id,
              pipeline_id: pipeline.id 
            })
          end
      end
    end
  
    def destroy
      jobs_applicants_pipelines = JobsApplicantsPipeline.where(jobs_applicant_id: @object.id).destroy_all

      @object.destroy
    end
  
    private
  
    def object_params
      @params.require(:jobs_applicant).permit(permitted_params)
    end
  
    def permitted_params
      %i[
        job_id
        applicant_id
      ]
    end
end