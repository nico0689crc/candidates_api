class Job < ApplicationRecord
    #--------------------------------------------- RELATIONSHIPS
        has_many :jobs_applicants
        has_many :pipelines
        has_many :applicants, through: :jobs_applicants
        
    #--------------------------------------------- VALIDATIONS
        validates :title, presence: true
        validates :description, presence: true
end
