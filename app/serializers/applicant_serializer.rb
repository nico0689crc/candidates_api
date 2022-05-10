class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email

  has_many :jobs_applicants, key: :jobs_applied
  
  class JobsApplicantSerializer < ActiveModel::Serializer
    attributes :id, :active, :url_token
  end
end
