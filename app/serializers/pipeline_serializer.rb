class PipelineSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :order

  has_one :attendant
  class AttendantSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :contact_email, :company_name, :contact_whatsapp, :contact_linked_in
  end
end
