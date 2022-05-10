class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description

  has_many :jobs_applicants, serializer: JobsApplicantSerializer, key: :applications
  has_many :pipelines, key: :pipelines_steps
end
