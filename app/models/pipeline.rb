class Pipeline < ApplicationRecord
  #--------------------------------------------- RELATIONSHIPS
      belongs_to :job
      belongs_to :attendant
      has_many :jobs_applicants_pipelines
  #--------------------------------------------- VALIDATIONS
      validates :title, presence: true
      validates :description, presence: true
      validates :order, presence: true, numericality: true
end
