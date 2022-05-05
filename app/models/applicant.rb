class Applicant < ApplicationRecord
    has_many :jobs_applicants
    has_many :jobs, through: :jobs_applicants
end
