class JobsApplicantsPipeline < ApplicationRecord
  belongs_to :jobs_applicant
  belongs_to :pipeline
end
