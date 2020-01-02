class ContractorSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :category, :projects_completed
end
