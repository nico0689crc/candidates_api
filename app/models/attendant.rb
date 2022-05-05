class Attendant < ApplicationRecord

    #--------------------------------------------- RELATIONSHIPS
        has_many :pipelines

    #--------------------------------------------- VALIDATIONS
        validates :first_name, presence: true
        validates :last_name, presence: true
        validates :contact_email, presence: true
        validates :company_name, presence: true
end
