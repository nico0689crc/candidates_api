class JobsApplicantSerializer < ActiveModel::Serializer
  attributes :id, :active, :url_token

  has_one :applicant
  has_many :jobs_applicants_pipelines, serializer: JobsApplicantsPipelinesSerializer, key: :pipelines_steps
end
