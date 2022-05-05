class Pipeline < ApplicationRecord
  belongs_to :job
  belongs_to :attendant
  has_many :jobs_applicants_pipelines
end
