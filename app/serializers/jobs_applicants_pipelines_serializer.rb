class JobsApplicantsPipelinesSerializer < ActiveModel::Serializer
  attributes :id, :passed, :feedback

  belongs_to :pipeline
end
