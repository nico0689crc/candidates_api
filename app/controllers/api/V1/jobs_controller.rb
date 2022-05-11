module Api
  module V1  
    class JobsController < ApiController
      before_action :set_job, only: %i[ show update destroy ]

      # GET /jobs
      def index
        @presenter = JobsPresenter.new(params)
        json_response(data: ActiveModel::Serializer::CollectionSerializer.new( @presenter.jobs, serializer: JobSerializer))
      end

      # GET /jobs/1
      def show
        json_response(data: JobSerializer.new(@job))
      end

      # POST /jobs
      def create
        job_manager = JobManager.new(params: params)
        
        if job_manager.create
          json_response(message: I18n.t(:success, scope: %i[messages create]), data: JobSerializer.new(job_manager.object), status: :created)
        else
          json_response(message: I18n.t(:error, scope: %i[messages create]), data: job_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # PATCH/PUT /jobs/1
      def update
        job_manager = JobManager.new(params: params, object: @job)
        
        if job_manager.update
          json_response(message: I18n.t(:success, scope: %i[messages update]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages update]), data: job_manager.object.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /jobs/1
      def destroy
        job_manager = JobManager.new(object: @job)
        
        if job_manager.destroy
          json_response(message: I18n.t(:success, scope: %i[messages destroy]), status: :no_content)
        else
          json_response(message: I18n.t(:error, scope: %i[messages destroy]), data: job_manager.object.errors, status: :unprocessable_entity)
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_job
          @job = Job.find(params[:id])
        end
    end
  end
end