module Api
  module V1  
    class JobsController < ApiController
      before_action :set_job, only: %i[ show update destroy ]

      # GET /jobs
      def index
        @jobs = Job.all

        render json: @jobs, :include => [ 
          :jobs_applicants => { 
            :include => [ 
              :applicant, 
              :jobs_applicants_pipelines => { 
                :include => [ 
                  :pipeline => { 
                    :include => [ :attendant ] 
                  } 
                ] 
              }
            ], 
          }
        ]
      end

      # GET /jobs/1
      def show
        render json: @job, :include => [ 
          :jobs_applicants => { 
            :include => [ 
              :applicant, 
              :jobs_applicants_pipelines => { 
                :include => [ 
                  :pipeline => { 
                    :include => [ :attendant ] 
                  } 
                ] 
              }
            ], 
          }
        ]
      end

      # POST /jobs
      def create
        @job = Job.new(job_params)

        if @job.save
          render json: @job, status: :created
        else
          render json: @job.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /jobs/1
      def update
        if @job.update(job_params)
          render json: @job
        else
          render json: @job.errors, status: :unprocessable_entity
        end
      end

      # DELETE /jobs/1
      def destroy
        @job.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_job
          @job = Job.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def job_params
          params.require(:job).permit(:title, :description, :active)
        end
    end
  end
end