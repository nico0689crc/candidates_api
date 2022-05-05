class JobsApplicant < ApplicationRecord
    #--------------------------------------------- RELATIONSHIPS
        belongs_to :job
        belongs_to :applicant
        has_many :jobs_applicants_pipelines
end
