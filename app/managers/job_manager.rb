class JobManager 
    attr_reader :object

    def initialize(params: nil, object: nil)
      @params = params    if params.present?
      @object = object    if object.present?
    end
  
    def build
      Job.new
    end
  
    def create
      @object = Job.new(object_params)
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
      @params.require(:job).permit(permitted_params)
    end
  
    def permitted_params
      %i[
        title
        description
        active
      ]
    end
end