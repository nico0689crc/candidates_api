class JobsApplicantsPipeline < ApplicationRecord
  #--------------------------------------------- RELATIONSHIPS
      belongs_to :jobs_applicant
      belongs_to :pipeline
end
