class AttendantSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :contact_email, :company_name, :contact_whatsapp, :contact_linked_in

  has_many :pipelines, key: :pepiles_to_attend
  
  class PipelineSerializer < ActiveModel::Serializer
    attributes :id, :title, :description
  end
end
