class PipelineSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :order

  has_one :attendant
end
