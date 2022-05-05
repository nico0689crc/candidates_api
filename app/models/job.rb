class Job < ApplicationRecord
    has_many :jobs_applicants
    has_many :pipelines
    has_many :applicants, through: :jobs_applicants
end
