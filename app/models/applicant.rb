class Applicant < ApplicationRecord
    #--------------------------------------------- RELATIONSHIPS
        has_many :jobs_applicants
        has_many :jobs, through: :jobs_applicants

    #--------------------------------------------- VALIDATIONS
        validates :first_name, presence: true
        validates :last_name, presence: true
        validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
